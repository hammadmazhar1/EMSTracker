package com.example.saad.emstracker;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.AsyncHttpResponseHandler;
import com.loopj.android.http.RequestParams;

import org.apache.http.Header;


public class HomeActivity extends ActionBarActivity {
    int backButtonCount;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
//        Intent intent = getIntent();
//        boolean registered = intent.getBooleanExtra("REGISTERED", false);
//        boolean success = intent.getBooleanExtra("SUCCESS", false);

        setContentView(R.layout.activity_home);
        backButtonCount = 0;
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_home, menu);
        return true;
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
        Intent intent = new Intent(this, RegisterActivity.class);
        startActivity(intent);
    }

    public void login(View view) {
        String s1 = ((EditText) findViewById(R.id.home_username)).getText().toString();
        String s2 = ((EditText) findViewById(R.id.home_password)).getText().toString();
        if (!s1.equals("") && !s2.equals("")) {
            AsyncHttpClient client = new AsyncHttpClient();
            RequestParams params = new RequestParams();
            params.put("session[username]", s1);
            params.put("session[password]", s2);
            client.post("https://immense-gorge-8570.herokuapp.com/login", params, new AsyncHttpResponseHandler() {
                @Override
                public void onStart() {
                    Toast.makeText(getApplicationContext(), "STARTED", Toast.LENGTH_SHORT).show();
                }

                @Override
                public void onSuccess(int statusCode, Header[] headers, byte[] responseBody) {
                    String str = "";
                    try {
                        str = new String(responseBody, "UTF-8");
                        Log.d("TESTING", str);
                        int id = str.indexOf("name=\"my_id\"");
                        id = id + 34;
                        str = str.substring(id, str.indexOf("\"", id));
                    } catch (Exception e) {}
                    Log.d("TESTING", str);
                    Log.d("TESTING", ((Integer)str.length()).toString());
                    if (str.charAt(0) >= '0' && str.charAt(0) <= '9') {
                        Toast.makeText(getApplicationContext(), "Welcome!", Toast.LENGTH_SHORT).show();
                        Intent intent = new Intent(getApplicationContext(), WebViewActivity.class);
                        intent.putExtra("ID", str);
                        startActivity(intent);
                    } else {
                        Toast.makeText(getApplicationContext(), "Incorrect username/password", Toast.LENGTH_SHORT).show();
                    }
                }

                @Override
                public void onFailure(int statusCode, Header[] headers, byte[] responseBody, Throwable error) {
                    Toast.makeText(getApplicationContext(), "The server is temporarily unavailable.", Toast.LENGTH_SHORT).show();
                }
            });
        } else {
            Toast.makeText(this, "Please input a username and password.", Toast.LENGTH_LONG).show();
        }
    }

    public void web(View view) {
        Intent intent = new Intent(this, WebViewActivity.class);
        startActivity(intent);
    }

    @Override
    public void onBackPressed() {
        if(backButtonCount >= 1)
        {
            Intent intent = new Intent(Intent.ACTION_MAIN);
            intent.addCategory(Intent.CATEGORY_HOME);
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            startActivity(intent);
            finish();
        }
        else
        {
            Toast.makeText(this, "Press the back button once again to close the application.", Toast.LENGTH_SHORT).show();
            backButtonCount++;
        }
    }
}
