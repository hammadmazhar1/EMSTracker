package com.example.saad.emstracker;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.AsyncHttpResponseHandler;
import com.loopj.android.http.RequestParams;

import org.apache.http.Header;


public class RegisterActivity extends ActionBarActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    public void register(View view) {
        String s1 = ((EditText) findViewById(R.id.register_username)).getText().toString();
        String s2 = ((EditText) findViewById(R.id.register_fullname)).getText().toString();
        String s3 = ((EditText) findViewById(R.id.register_password)).getText().toString();
        String s4 = ((EditText) findViewById(R.id.register_confirmpassword)).getText().toString();
        String s5 = ((EditText) findViewById(R.id.register_rollno)).getText().toString();
        String s6 = ((EditText) findViewById(R.id.register_phoneno)).getText().toString();
        if (!s1.equals("") && !s2.equals("") && !s3.equals("") && !s4.equals("") && !s5.equals("") && !s6.equals("")) {
            if (s3.equals(s4)) {
                AsyncHttpClient client = new AsyncHttpClient();
                RequestParams params = new RequestParams();
                params.put("user[username]", s1);
                params.put("user[name]", s2);
                params.put("user[password]", s3);
                params.put("user[password_confirmation]", s4);
                params.put("user[rollno]", s5);
                params.put("user[phoneno]", s6);
                client.post("https://immense-gorge-8570.herokuapp.com/users", params, new AsyncHttpResponseHandler() {
                    @Override
                    public void onStart() {
                        Toast.makeText(getApplicationContext(), "STARTED", Toast.LENGTH_SHORT).show();
                    }

                    @Override
                    public void onSuccess(int statusCode, Header[] headers, byte[] responseBody) {
                        int id = 0;
                        String str = "";
                        try {
                            str = new String(responseBody, "UTF-8");
                            Log.d("TESTING", str);
                            id = str.indexOf("flash notice");
                        } catch (Exception e) {
                        }
                        Log.d("TESTING", ((Integer) id).toString());
                        if (id > 0) {
                            Toast.makeText(getApplicationContext(), "User successfully created!", Toast.LENGTH_LONG).show();
                            Intent intent = new Intent(getApplicationContext(), HomeActivity.class);
                            startActivity(intent);
                            finish();
                        } else {
                            Toast.makeText(getApplicationContext(), "That username already exists", Toast.LENGTH_SHORT).show();
                        }
                    }

                    @Override
                    public void onFailure(int statusCode, Header[] headers, byte[] responseBody, Throwable error) {
                        Toast.makeText(getApplicationContext(), "The server is temporarily unavailable.", Toast.LENGTH_SHORT).show();
                    }
                });
            } else {
                Toast.makeText(getApplicationContext(), "The passwords do not match.", Toast.LENGTH_SHORT).show();
            }
        } else {
            Toast.makeText(this, "Please fill in all the fields.", Toast.LENGTH_LONG).show();
        }
    }
}
