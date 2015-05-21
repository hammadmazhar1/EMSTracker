package com.example.saad.emstracker;

import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.text.util.Linkify;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.JsonHttpResponseHandler;
import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;


public class UserActivityDisplayMFR extends ActionBarActivity {
    ProgressDialog mDialog;
    AsyncHttpClient client;
    JSONArray array;
    int arraySize;
    int arrayIndex;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_user_activity_display_mfr);

        mDialog = new ProgressDialog(this);
        mDialog.setMessage("Working");
        mDialog.setCanceledOnTouchOutside(false);
        mDialog.setOnCancelListener(new DialogInterface.OnCancelListener() {
            @Override
            public void onCancel(DialogInterface dialog) {
                if (client != null) {
                    client.cancelRequests(getApplicationContext(), true);
                }
                Intent intent = new Intent(getApplicationContext(), UserActivity.class);
                startActivity(intent);
            }
        });

        arraySize = 0;
        arrayIndex = 0;
        fetchData();
    }

    public void fetchData() {
//        String urlString = "";
        String QUERY_URL = "http://openlibrary.org/search.json?q=";
        String urlString = "alice";
        try {
            urlString = URLEncoder.encode(urlString, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            Intent intent = new Intent(getApplicationContext(), UserActivity.class);
            intent.putExtra("EXTRA", e.getMessage());
            startActivity(intent);
        }

        // Create a client to perform networking
        client = new AsyncHttpClient();
        mDialog.show();

        // Have the client get a JSONArray of data and define how to respond
        client.get(getApplicationContext(), QUERY_URL+urlString, new JsonHttpResponseHandler() {
//            @Override
            public void onSuccess(JSONObject jsonObject) {
                mDialog.dismiss();
                Toast.makeText(getApplicationContext(), "Success!", Toast.LENGTH_LONG).show();

                // update the data in your custom method.
//                mJSONAdapter.updateData(jsonObject.optJSONArray("docs"));
                array = jsonObject.optJSONArray("docs");
                arraySize = jsonObject.optInt("num_found");
                Log.e("EMS", "NUM = " + arraySize);

                if (arraySize > 0) {
                    renderJSON();
                } else {
                    Toast.makeText(getApplicationContext(), "No Active MFR's Found", Toast.LENGTH_LONG).show();
                }
            }

//            @Override
            public void onFailure(int statusCode, Throwable throwable, JSONObject error) {
                mDialog.dismiss();
                String errorMessage = "HERE     Error: " + statusCode + " " + throwable.getMessage();
                Log.e("EMS", errorMessage);

                Intent intent = new Intent(getApplicationContext(), UserActivity.class);
                intent.putExtra("EXTRA", errorMessage);
                startActivity(intent);
            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_user_activity_display_mfr, menu);
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

    public void renderJSON() {
        try {
            JSONObject json = (JSONObject) array.get(arrayIndex);
            ((TextView) findViewById(R.id.dispMFR_name)).setText(json.optString("title"));                   // CHANGE TITLE
            TextView text = (TextView) findViewById(R.id.dispMFR_number);
//            text.setText(json.optString("author_name"));                                                   // CHANGE AUTHOR_NAME
            text.setText("03002485120");
            Linkify.addLinks(text, Linkify.PHONE_NUMBERS);

//            String gender = json.optString("gender");                                                        // FIX GENDER
//            String imageURL = json.optString("picture_url");                                                 // FIX PICTURE_URL
            ImageView image = (ImageView) findViewById(R.id.dispMFR_picture);
//            if (gender.equals("Male")) {
                String imageURL = "http://static.tumblr.com/2422f282a6a9ab6eb36eb2f1d5628332/q53bmki/3f7muw49f/tumblr_static_pikachu_12.jpg";
                Picasso.with(getApplicationContext()).load(imageURL).placeholder(R.drawable.silhouette_male).into(image);
//            } else {
//                Picasso.with(getApplicationContext()).load(imageURL).placeholder(R.drawable.silhouette_female).into(image);
//            }
        } catch (Exception e) {
            Toast.makeText(getApplicationContext(), "ERROR OCCURRED WHILE RENDERING JSON", Toast.LENGTH_LONG).show();
        }
    }

    public void next(View view) {
        arrayIndex = (arrayIndex + 1) % arraySize;
        renderJSON();
    }
}
