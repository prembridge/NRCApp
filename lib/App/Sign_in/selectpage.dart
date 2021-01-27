import 'package:flutter/material.dart';
import 'package:flutter_app/App/Sign_in/sign_in%20page.dart';
import 'Pinpage.dart';
import 'passcodepage.dart';

class selectpage extends StatefulWidget {
  @override
  _selectpageState createState() => _selectpageState();
}

class _selectpageState extends State<selectpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('select page'),

      ),
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin:EdgeInsets.only(bottom: 20),
                child: Text(' Login To Continue',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // inputTextdata(
              //   hint: 'MobileNum...',
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // inputTextdata(
              //   hint: 'Password..',
              // ),
              // SizedBox(
              //   height: 20,
              // ),

            ],

          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: <Widget>[

              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>passcodepage())
                  );
                },
                child: PrimaryButton(
                  btnText: "Select passcode password",
                ),


              ),
            ],

          ),
          SizedBox(
            height: 20,
          ),

          Column(
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Pinpage())
                  );
                },
                child: PrimaryButton(
                  btnText: "Select finger print to authenticate",
                ),


              ),
            ],


          ),

        ],

      ),

    );
  }
}
