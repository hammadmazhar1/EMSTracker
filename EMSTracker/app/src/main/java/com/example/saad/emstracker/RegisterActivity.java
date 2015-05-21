package com.example.saad.emstracker;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;


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
        String s2 = ((EditText) findViewById(R.id.register_password)).getText().toString();
        String s3 = ((EditText) findViewById(R.id.register_rollno)).getText().toString();
        String s4 = ((EditText) findViewById(R.id.register_phoneno)).getText().toString();
        if (!s1.equals("") && !s2.equals("") && !s3.equals("") && !s4.equals("")) {
            boolean success = true;

            // success = POST REQUEST

            Intent intent = new Intent(this, HomeActivity.class);
            intent.putExtra("SUCCESS", success);
            intent.putExtra("REGISTERED", true);
            startActivity(intent);
            finish();
        } else {
            Toast.makeText(this, "Please fill in all the fields.", Toast.LENGTH_LONG).show();
        }
    }
}
