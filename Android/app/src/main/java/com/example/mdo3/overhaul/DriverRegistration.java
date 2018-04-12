package com.example.mdo3.overhaul;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Patterns;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

/**
 * Created by Rohini on 4/2/2018.
 */

public class DriverRegistration extends Activity
{
    private EditText et_name, et_email, et_password, et_cpassword, et_phone, et_address, et_vehicleNumber, et_vehicleName;
    Button rgbtn;
    String name,email,password,cpassword,vehicle_name,vehicle_number;
    String phoneNumber, address;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register_driver);
        et_name = (EditText) findViewById(R.id.name);
        et_email = (EditText) findViewById(R.id.email);
        et_password = (EditText) findViewById(R.id.password);
        et_cpassword = (EditText) findViewById(R.id.confirm_password);
        et_phone = (EditText) findViewById(R.id.phone);
        et_address = (EditText) findViewById(R.id.address);
        et_vehicleName = (EditText) findViewById(R.id.vehicle_model);
        et_vehicleNumber = (EditText) findViewById(R.id.vehicle_year);
        rgbtn = (Button)findViewById(R.id.register_user);
        rgbtn.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                register();
            }

        });
    }

    public void register()
    {
        initialize();
        //If the data is invalid throw error

        if(!validate())
        {
            Toast.makeText(this, "Signup Failed !", Toast.LENGTH_SHORT).show();
        }
        else
        {
            //(String UserName, String PassWord, String Name, String PhoneNumber, String DriverLicenseNumber, Timestamp DateRegistered,
            //String CarMake, String CarModel, int CarYear, String LicensePlateNumber, float LoadCapacity,
            //String BankAccountNumber, String RoutingNumber, String BillingName)
            Intent intent = new Intent(this, driver_acc_info.class);
            intent.putExtra("UserName", email);
            intent.putExtra("Password", password);
            intent.putExtra("Name", name);
            intent.putExtra("PhoneNumber", phoneNumber);
            intent.putExtra("Address", address);
            startActivity(intent);
            Toast.makeText(this, "Signup successful !", Toast.LENGTH_SHORT).show();
        }
    }

    public void initialize(){
        name = et_name.getText().toString().trim();
        email = et_email.getText().toString().trim();
        password = et_password.getText().toString().trim();
        cpassword = et_cpassword.getText().toString().trim();
        vehicle_name = et_vehicleName.getText().toString().trim();
        vehicle_number = et_vehicleNumber.getText().toString().trim();
        phoneNumber = et_phone.getText().toString().trim();
        address = et_address.getText().toString().trim();

    }

    //validation check
    public boolean validate(){
        boolean valid = true;

        if(name.isEmpty() || password.isEmpty() || cpassword.isEmpty()){
            valid = false;
        }
        //TODO: something is wrong with this if statement.
        /*
        if(email.isEmpty() || Patterns.EMAIL_ADDRESS.matcher(email).matches()){
            valid = false;
        }

        if(vehicle_name.isEmpty()||vehicle_number.isEmpty()){
            valid = false;
        }
        */
        if(password.equals(cpassword)){
            valid = false;
        }

        return true;
    }
}
