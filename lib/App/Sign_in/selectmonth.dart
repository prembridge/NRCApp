import 'package:flutter/material.dart';
import 'package:flutter_app/App/Sign_in/sign_in%20page.dart';
import 'Homepage.dart';
class selectmonth extends StatefulWidget {
  @override
  _selectmonthState createState() => _selectmonthState();
}

class _selectmonthState extends State<selectmonth> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" Select Month and year"),
        ),
        body: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: DropdownButton(
                            value: _value,
                            items: [
                              DropdownMenuItem(
                                child: Text("Jan"),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("Feb"),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                  child: Text("March"),
                                  value: 3
                              ),
                              DropdownMenuItem(
                                  child: Text("April"),
                                  value: 4
                              ),

                            ],
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            }),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: DropdownButton(
                            value: _value,
                            items: [
                              DropdownMenuItem(
                                child: Text("2020"),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("2020"),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                  child: Text("2020"),
                                  value: 3
                              ),
                              DropdownMenuItem(
                                  child: Text("2020"),
                                  value: 4
                              ),

                            ],
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            }),
                      )
                    ],
                  ),
                ],
              ),

            ),
            Container(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>Homepage())
                      );
                    },
                    child: PrimaryButton(
                      btnText: "Ok",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),


    );
  }
}
