import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CamCap extends StatefulWidget {
  const CamCap({Key? key}) : super(key: key);

  @override
  State<CamCap> createState() => _CamCapState();
}

class _CamCapState extends State<CamCap> {

  late File image_f;
  void getImageFromDeviceCam() async{
    XFile? image_content = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 480);

    setState(()
    {
      image_f =  File(image_content!.path);
    }
    );
    
    //Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capture Image'),
        backgroundColor: Colors.blue[100],
        centerTitle: true,
      ),
    );
  }
}

