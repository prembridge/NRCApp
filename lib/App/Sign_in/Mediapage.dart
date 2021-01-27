import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
class Mediapage extends StatefulWidget {


  @override
  _MediapageState createState() => _MediapageState();
}

class _MediapageState extends State<Mediapage> {
  File _image;
  Future getImage(bool isCamera) async{
    File image;
    if(isCamera){
      image =  await ImagePicker.pickImage(source: ImageSource.camera);
    } else{
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _image=image;
    });
  }

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
            IconButton(icon: Icon(Icons.web,size: 40,color: Colors.black,),
                onPressed:(){
              getImage(false);
                }),
            IconButton(icon: Icon(Icons.add_a_photo_outlined ,size: 40,color: Colors.black,),
                 onPressed:(){
              getImage(true);
                 }),
            _image==null?Container():Image.file(_image,height: 100,width: 100,),
          ],
        ),
      ),

    );
  }
}
