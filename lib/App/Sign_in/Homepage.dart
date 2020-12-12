import 'package:flutter/material.dart';

import 'Mediapage.dart';
import 'Savepage.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

// var _dropvalue=['Gath','Hc','Mc','PC','Av'];
// var _currentItemSelected='Gath';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('homepage'),

      ),
      body: Column(
        children: [

          Column(
            children: [
               Container(
                color: Colors.blueGrey,
                width: 450,
                height: 130,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [

                    // Padding(
                    //   padding: const EdgeInsets.only(right:300),
                    //
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       new Icon(
                    //         Icons.arrow_back_ios_sharp,
                    //         size: 20,
                    //         color: Colors.white,
                    //
                    //
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.only(left:300),
                    //         child: Column(
                    //           children: [
                    //             new Icon(
                    //               Icons.arrow_forward_ios_sharp,
                    //               size: 20,
                    //               color: Colors.white,
                    //
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),


                    Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/cp.png'),
                          radius: 40,

                        ),
                      ],
                    ),

                   new Text('ID 123..',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                   //  new Text('Name premkumar',
                   //    style: TextStyle(
                   //      fontSize: 15,
                   //    ),
                   //  ),
                   //  new Text('Star of Year:2020',
                   //    style: TextStyle(
                   //      fontSize: 15,
                   //    ),
                   //  ),
                   //


                  ],

                ),



              ),


            ],

          ),

          Column(

            children: [
              // Expanded(
              //   flex: 1,
              //   child: PageView(children: <Widget>[
              //     Container(child: Text('Page 1')),
              //     Container(child: Text('Page 2')),
              //     Text('Page 3'),
              //   ]),
              // ),
              Container(
                color: Colors.grey,
                width: 450,
                height: 450,
                child:Column(
                  children: [
                    Row(
                      children: [
                        new RaisedButton(

                            onPressed: null,
                            hoverColor: Colors.white,
                            child:Text('Type',

                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,

                            ),
                            )),
                        SizedBox(width: 50),
                        new RaisedButton(onPressed: null,
                            child:Text('Name',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            )),
                        SizedBox(width: 40),
                        new RaisedButton(onPressed: null,
                            child:Text('Start of Year',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                    // DropdownButton<String>(
                    //     items:  _dropvalue.map((String dropDownStringItem) {
                    //      return DropdownMenuItem<String>(
                    //        value: dropDownStringItem,
                    //
                    //          child: Text(dropDownStringItem),
                    //      );
                    //     }).toList(),
                    //   onChanged:(String newValueSelected){
                    // setState(() {
                    //   this._currentItemSelected =newValueSelected;
                    //     });
                    //   },
                    //   value: _currentItemSelected,
                    // ),

                    Container(
                      height: 180,
                      child: Padding(
                        padding: const EdgeInsets.only(right:300),
                        child: Column(
                          children: <Widget> [


                            new Text('State:',
                              style: TextStyle(
                                fontSize: 20,
                              ),

                            ),
                            new Text('District:',
                              style: TextStyle(
                                fontSize: 20,
                              ),

                            ),
                            new Text('Block:',
                              style: TextStyle(
                                fontSize: 20,
                              ),

                            ),
                            new Text('Colony:',
                              style: TextStyle(
                                fontSize: 20,
                              ),

                            ),
                            new Text('Village:',
                              style: TextStyle(
                                fontSize: 20,
                              ),

                            ),
                            new Text('Habitation',
                              style: TextStyle(
                                fontSize: 20,
                              ),

                            ),
                            new Text('Un Hab:',
                              style: TextStyle(
                                fontSize: 20,
                              ),

                            ),
                          ]
                        ),
                      ),
                    ),

                    Container(

                      child: Row(
                        children: [
                          new Text('18'
                          ),
                       SizedBox(width: 150),
                          new Text('18'
                          ),
                          SizedBox(width: 150),
                          new Text('18'
                          ),
                        ],
                      ),
                    ),
                    Container(
                    height: 200,
                      padding: const EdgeInsets.only(bottom:150),
                      child: Row(

                        children: [

                          Container(

                            width: 130.0,
                            child: new TextField(
                              decoration:new InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.all(Radius.circular(20)),


                                ),

                              hintText: 'Total Believers',

                              ),

                            ),
                          ),
                          SizedBox(width: 10),
                          Container(

                            width: 130.0,
                            child: new TextField(
                              decoration:new InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.all(Radius.circular(20)),


                                ),

                                hintText: 'Total Baptism',

                              ),

                            ),
                          ),
                          SizedBox(width: 10),
                          Container(

                            width: 130.0,
                            child: new TextField(
                              decoration:new InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.all(Radius.circular(20)),


                                ),

                                hintText: 'Avg Attadance',

                              ),

                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ),
            ],
          ),
      Container(

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            GestureDetector(

              child: new Text('Save',
                  style: new TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20,)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Savepage())
                );
              },
            ),
            SizedBox(width: 50),
            GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Mediapage())
                  );
                },
                child: new Text(
                  'Media.',
                  style: new TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold,fontSize: 20,),
                ))
          ],
        ),
      ),
        ],


      ),

    );
  }
}
