import 'package:flutter/material.dart';
import 'package:flutter_app/App/Sign_in/sign_in%20page.dart';
import 'Pinpage.dart';
class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registionpage'),

      ),
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
              margin:EdgeInsets.only(bottom: 20),
               child: Text('Login To Continue',
              style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              ),
             ),
           ),
              inputTextdata(
                hint: 'MobileNum...',
              ),
              SizedBox(
                height: 20,
              ),
              inputTextdata(
                hint: 'Password',
              ),
              SizedBox(
                height: 20,
              ),
              inputTextdata(
                hint: 'OTP',
              ),

            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Pinpage())
                  );
                },
                child: PrimaryButton(
                  btnText: "Ok",
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }
}
