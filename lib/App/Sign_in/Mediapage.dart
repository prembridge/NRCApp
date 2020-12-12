import 'package:flutter/material.dart';

class Mediapage extends StatefulWidget {
  @override
  _MediapageState createState() => _MediapageState();
}

class _MediapageState extends State<Mediapage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Mediapage'),

      ),
      body:Container(
        padding: EdgeInsets.all(10),
        child: GridView(
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            Card(
              elevation: 10,

              child: Image.asset('assets/images/cp.png'),

            ),
            Card(
                elevation: 10,
                child: Image.asset('assets/images/cp.png')
            ),
            Card(
                elevation: 10,
                child: Image.asset('assets/images/cp.png')
            ),
            Card(
                elevation: 10,
                child: Image.asset('assets/images/cp.png')
            ),
          ],
        ),
      )

    );
  }
}
