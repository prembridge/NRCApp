import 'package:flutter/material.dart';

import 'Mediapage.dart';
import 'Savepage.dart';
import 'Addnewpage.dart';
import 'package:http/http.dart'as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'package:flutter_swiper/flutter_swiper.dart';

Future<Album> fetchAlbum() async {
  try {
    log('testing......');
    final http.Response token =
    await http.post(
      'https://nrcoperations.co.in/fmi/data/vLatest/databases/OA_Master/sessions',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Basic c3VzaGlsOkphY29iNw==',
      },

    );
    log('token:$token');

    Map<String, dynamic> responsetoken = jsonDecode(token.body);
    var result = responsetoken['response'];
    var tokenresult = result['token'];

    log('result...in field:$responsetoken');

    final response =
    await http.get(
      "https://nrcoperations.co.in/fmi/data/vLatest/databases/OA_Master/layouts/General_Report_app/records",
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenresult'
      },
    );
    Map<String, dynamic> responseJson = jsonDecode(response.body);
    var res = responseJson['response'];
    var reresult = res['data'];
    log('result...in field:$reresult');
    for (int i = 0; i < reresult.length; i++) {
      //return Album.fromJson(reresult(i));
      log("i values:$i");
      String type = reresult[i]['fieldData'][ 'Gathering_Status'];
      log(" Gathering_Status$type");
    }
    return Album.fromJson(reresult[0]);
  }
  catch (e) {
    print(e);
    return null;
  }


}
class MyStructure {
  final int id;
  final String text;
  MyStructure({this.id, this.text});
}
class MyWidget extends StatelessWidget {
  final MyStructure widgetStructure;
  MyWidget(this.widgetStructure);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        child: Text('${widgetStructure.id} ${widgetStructure.text}')
    );
  }
}
class Album {
  final int Bel_Added;
  final int New_BPT;
  final String Full_Name;
  final String State;
  final String District;
  final String Block;
  final String Village;
  final String Habitation;
  final String Gathering_Status;
  final int Year_of_Start;
  final String Un_Habitation;
  final int Pin;
  Album({this.Bel_Added, this.New_BPT, this.Full_Name,this.State,this.District,this.Block,this.Village,this.Habitation,this.Gathering_Status,this.Year_of_Start,this.Un_Habitation,this.Pin});

  factory Album.fromJson(Map<String, dynamic> json) {
    // var name = json['fieldData']['Reporting_Year'];
    // log('json:$name');
    return Album(
        Bel_Added: json['Bel_Added'],
        New_BPT: json['New_BPT'],
        Full_Name: json['fieldData']['Full_Name'],
        State:json['fieldData']['State'],
        District:json['fieldData']['District'],
        Block:json['fieldData']['Block'],
        Village:json['fieldData']['Village'],
        Habitation:json['fieldData']['Habitation'],
        Gathering_Status: json['fieldData']['Gathering_Status'],
        Year_of_Start:json['fieldData']['Year_of_Start'],
        Un_Habitation:json['fieldData'][' Un_Habitation'],
        Pin:json['fieldData']['Pin']
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<Album> futureAlbum;
  SwiperController controller;

  List<bool> autoplayes;

  List<SwiperController> controllers;
  List<MyStructure> widgetList = [];

// var _dropvalue=['Gath','Hc','Mc','PC','Av'];
// var _currentItemSelected='Gath';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureAlbum = fetchAlbum();
    controller = new SwiperController();
    autoplayes = new List()
      ..length = 10
      ..fillRange(0, 10, false);
    controllers = new List()
      ..length = 10
      ..fillRange(0, 10, new SwiperController());

    for (int i = 0; i < 10; i++) {
      widgetList.add(MyStructure(id: i, text: ' this is index ${i}'));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('homepage'),

        ),
        body: Container(
            color: Colors.blueGrey,
            width: 750,

            child: new Swiper(
                loop: false,
                itemCount: 10,
                controller: controller,
                pagination: new SwiperPagination(),
                itemBuilder: (BuildContext context, int index) {
                  return new Column(
                      children: <Widget>[
                        Column(
                          children: [

                            Column(
                              children: [
                                Container(
                                  color: Colors.blueGrey,
                                  width: 750,
                                  height: 130,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[


                                      Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/cp.png'),
                                            radius: 40,

                                          ),
                                        ],
                                      ),

                                      new Text('ID 123..',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Addnewpage())
                                                );
                                              },
                                              child: new Text('Add New',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),


                                    ],

                                  ),


                                ),


                              ],

                            ),

                            Column(

                              children: <Widget>[

                                // new Swiper(
                                //
                                //  // controller: controllers[index],
                                //  // pagination: new SwiperPagination(),
                                //   //itemCount: widgetList.length,
                                //   //itemBuilder: (BuildContext context, int index) {
                                //     return MyWidget(widgetList[index]);
                                //   },
                                //   //autoplay: autoplayes[index],
                                // ),
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

                                    height: 450,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Row(
                                          children: [
                                            new FutureBuilder<Album>(
                                              future: futureAlbum,
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return Text(
                                                    "Type:${snapshot.data
                                                        .Gathering_Status}",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      color: Colors.black,
                                                    ),);
                                                } else if (snapshot.hasError) {
                                                  return Text(
                                                      "${snapshot.error}");
                                                }

                                                // By default, show a loading spinner.
                                                return CircularProgressIndicator();
                                              },
                                            ),
                                            SizedBox(width: 30),
                                            // new RaisedButton(onPressed: null,
                                            //
                                            //     child:Text('Name',
                                            //       style: TextStyle(
                                            //         fontSize: 20,
                                            //         color: Colors.white,
                                            //       ),
                                            //     )),
                                            new FutureBuilder<Album>(
                                              future: futureAlbum,
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return Text(
                                                    " Name:${snapshot.data
                                                        .Full_Name}",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      color: Colors.black,
                                                    ),);
                                                } else if (snapshot.hasError) {
                                                  return Text(
                                                      "${snapshot.error}");
                                                }

                                                // By default, show a loading spinner.
                                                return CircularProgressIndicator();
                                              },
                                            ),

                                            SizedBox(width: 30),
                                            new FutureBuilder<Album>(
                                              future: futureAlbum,
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return Text(
                                                    "Year of Start:${snapshot
                                                        .data.Year_of_Start}",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      color: Colors.black,
                                                    ),);
                                                } else if (snapshot.hasError) {
                                                  return Text(
                                                      "${snapshot.error}");
                                                }

                                                // By default, show a loading spinner.
                                                return CircularProgressIndicator();
                                              },
                                            ),
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
                                        SizedBox(
                                          height: 20,
                                        ),

                                        Container(

                                          child: Column(
                                            //mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[


                                                Container(

                                                  child: new FutureBuilder<
                                                      Album>(
                                                    future: futureAlbum,
                                                    builder: (context,
                                                        snapshot) {
                                                      if (snapshot.hasData) {
                                                        return Text(
                                                          " State:${snapshot
                                                              .data.State},",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight
                                                                .bold,
                                                            color: Colors.black,
                                                          ),);
                                                      } else
                                                      if (snapshot.hasError) {
                                                        return Text("${snapshot
                                                            .error}");
                                                      }

                                                      // By default, show a loading spinner.
                                                      return CircularProgressIndicator();
                                                    },
                                                  ),
                                                ),

                                                Container(

                                                  child: new FutureBuilder<
                                                      Album>(
                                                    future: futureAlbum,
                                                    builder: (context,
                                                        snapshot) {
                                                      if (snapshot.hasData) {
                                                        return Text(
                                                          " District:${snapshot
                                                              .data.District}",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight
                                                                .bold,
                                                            color: Colors.black,
                                                          ),
                                                        );
                                                      } else
                                                      if (snapshot.hasError) {
                                                        return Text("${snapshot
                                                            .error}");
                                                      }

                                                      // By default, show a loading spinner.
                                                      return CircularProgressIndicator();
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  width: 150,
                                                  child: new FutureBuilder<
                                                      Album>(
                                                    future: futureAlbum,
                                                    builder: (context,
                                                        snapshot) {
                                                      if (snapshot.hasData) {
                                                        return Text(
                                                          " Block:${snapshot
                                                              .data.Block}",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight
                                                                .bold,
                                                            color: Colors.black,
                                                          ),);
                                                      } else
                                                      if (snapshot.hasError) {
                                                        return Text("${snapshot
                                                            .error}");
                                                      }

                                                      // By default, show a loading spinner.
                                                      return CircularProgressIndicator();
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  width: 150,
                                                  child: new Text('Colony:',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                    ),

                                                  ),
                                                ),
                                                Container(
                                                  width: 350,
                                                  child: new FutureBuilder<
                                                      Album>(
                                                    future: futureAlbum,
                                                    builder: (context,
                                                        snapshot) {
                                                      if (snapshot.hasData) {
                                                        return Text(
                                                          " Village:${snapshot
                                                              .data.Village}"
                                                          , textAlign: TextAlign
                                                            .center,
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight
                                                                .bold,
                                                            color: Colors.black,
                                                          ),);
                                                      } else
                                                      if (snapshot.hasError) {
                                                        return Text("${snapshot
                                                            .error}");
                                                      }

                                                      // By default, show a loading spinner.
                                                      return CircularProgressIndicator();
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  width: 150,
                                                  child: new FutureBuilder<
                                                      Album>(
                                                    future: futureAlbum,
                                                    builder: (context,
                                                        snapshot) {
                                                      if (snapshot.hasData) {
                                                        return Text(
                                                          " Habitation:${snapshot
                                                              .data
                                                              .Habitation}",
                                                          textAlign: TextAlign
                                                              .center,

                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight
                                                                .bold,
                                                            color: Colors.black,
                                                          ),);
                                                      } else
                                                      if (snapshot.hasError) {
                                                        return Text("${snapshot
                                                            .error}");
                                                      }

                                                      // By default, show a loading spinner.
                                                      return CircularProgressIndicator();
                                                    },
                                                  ),
                                                ),
                                                Container(

                                                  width: 150,
                                                  child: new FutureBuilder<
                                                      Album>(
                                                    future: futureAlbum,
                                                    builder: (context,
                                                        snapshot) {
                                                      if (snapshot.hasData) {
                                                        return Text(
                                                          "UnHabitation:${snapshot
                                                              .data
                                                              .Un_Habitation}",
                                                          textAlign: TextAlign
                                                              .center,

                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight
                                                                .bold,
                                                            color: Colors.black,
                                                          ),);
                                                      } else
                                                      if (snapshot.hasError) {
                                                        return Text("${snapshot
                                                            .error}");
                                                      }

                                                      // By default, show a loading spinner.
                                                      return CircularProgressIndicator();
                                                    },
                                                  ),
                                                ),
                                                Container(

                                                  width: 150,
                                                  child: new FutureBuilder<
                                                      Album>(
                                                    future: futureAlbum,
                                                    builder: (context,
                                                        snapshot) {
                                                      if (snapshot.hasData) {
                                                        return Text(
                                                          "Pin:${snapshot.data
                                                              .Pin}",
                                                          textAlign: TextAlign
                                                              .center,

                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight
                                                                .bold,
                                                            color: Colors.black,
                                                          ),);
                                                      } else
                                                      if (snapshot.hasError) {
                                                        return Text("${snapshot
                                                            .error}");
                                                      }

                                                      // By default, show a loading spinner.
                                                      return CircularProgressIndicator();
                                                    },
                                                  ),
                                                ),
                                              ]
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
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

                                          // padding: const EdgeInsets.only(bottom:150),
                                          child: Row(

                                            children: [

                                              Container(

                                                width: 130.0,
                                                child: new TextField(
                                                  decoration: new InputDecoration(
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white),
                                                      borderRadius: BorderRadius
                                                          .all(
                                                          Radius.circular(20)),


                                                    ),

                                                    hintText: 'Total Believers',

                                                  ),

                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Container(

                                                width: 130.0,
                                                child: new TextField(
                                                  decoration: new InputDecoration(
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white),
                                                      borderRadius: BorderRadius
                                                          .all(
                                                          Radius.circular(20)),


                                                    ),

                                                    hintText: 'Total Baptism',

                                                  ),

                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Container(

                                                width: 130.0,
                                                child: new TextField(
                                                  decoration: new InputDecoration(
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white),
                                                      borderRadius: BorderRadius
                                                          .all(
                                                          Radius.circular(20)),


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
                                        style: new TextStyle(color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,)),
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                              builder: (context) => Savepage())
                                      );
                                    },
                                  ),
                                  SizedBox(width: 50),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Mediapage())
                                        );
                                      },
                                      child: new Text(
                                        'Media.',
                                        style: new TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,),
                                      )),
                                  SizedBox(width: 50),
                                  // GestureDetector(
                                  //     onTap: (){
                                  //       Navigator.push(context,
                                  //           MaterialPageRoute(builder: (context)=>Addnewpage())
                                  //       );
                                  //     },
                                  //     child: new Text(
                                  //       'AddNew.',
                                  //       style: new TextStyle(
                                  //         color: Colors.red, fontWeight: FontWeight.bold,fontSize: 20,),
                                  //     ))
                                ],
                              ),

                            ),
                          ],


                        ),

                      ]);
                })));
  }

}


