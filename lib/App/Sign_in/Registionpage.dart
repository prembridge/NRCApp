import 'package:flutter/material.dart';
import 'package:flutter_app/App/Sign_in/sign_in%20page.dart';

import 'Login.dart';
class Registionpage extends StatefulWidget {
  @override
  _RegistionpageState createState() => _RegistionpageState();
}

class _RegistionpageState extends State<Registionpage> {
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
                child: Text(' Registration To Continue',
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
                hint: 'Password..',
              ),
              SizedBox(
                height: 20,
              ),

            ],

          ),
          SizedBox(
            height: 20,
          ),
           PrimaryButton(
            btnText: "Ok",

          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Loginpage())
                  );
                },
                child: PrimaryButton(
                  btnText: "login",
                ),
              ),
            ],
          ),

        ],

      ),

    );
  }
}
