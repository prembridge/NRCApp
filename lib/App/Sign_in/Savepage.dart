import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

Future<Album> fetchAlbum() async {

  final response =
  await http.get('https://oacloud.fmi.filemaker-cloud.com/fmi/data/vLatest/databases/OA_Master/layouts/Aps_users/records',
    headers: {HttpHeaders.authorizationHeader: "Bearer de881513090348f99ac7f579b000cbaa433cacbec362a7f9182e"},
  );
  final responseJson = jsonDecode(response.body);
   print(responseJson);
  return Album.fromJson(responseJson);


  // if (response.statusCode == 200) {
  //
  //   // If the server did return a 200 OK response,
  //   // then parse the JSON.
  //   return Album.fromJson(jsonDecode(response.body));
  //
  // } else {
  //
  //   // If the server did not return a 200 OK response,
  //   // then throw an exception.
  //   throw Exception('Failed to load album');
  // }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}


class Savepage extends StatefulWidget {
  @override
  _SavepageState createState() => _SavepageState();
}

class _SavepageState extends State<Savepage> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureAlbum = fetchAlbum();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
