import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:food_recognition/pages/image_recognition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:food_recognition/pages/mlModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'AWS_image_recognition.dart';
import 'package:food_recognition/pages/caloriestable.dart';

class CamCap extends StatefulWidget {
  const CamCap({Key? key}) : super(key: key);

  @override
  State<CamCap> createState() => _CamCapState();
}

class _CamCapState extends State<CamCap> {
  Future<File> defaultCamImgPath() async
  {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    return File('$path/resoruces/default_cam');
  }

  File? image_f;// = Image(image: AssetImage('resoruces/default_cam'));
  //var image_f = File(await defaultCamImgPath());
  //File image_f = await defaultCamImgPath();
  //late File image_f;
  bool image_captured = false;
  String? food_item;
  String? calories;
  String? food_item_amazon;


  /*
  _CamCapState()
  {
    image_f = await defaultCamImgPath();
  }
   */

  void getImageFromDeviceCam() async{
    XFile? image_content = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 480);

    String? item = await classifyImage(File(image_content!.path));
    food_item_amazon = await UploadImagetoS3(File(image_content!.path));
    //runModel(File(image_content!.path));
    setState(()
    {
      image_f =  File(image_content!.path);
      food_item = food_item_amazon;
      image_captured = true;
      calories = getCals(food_item_amazon);
      //String path = image_f.path!= null ? image_f.path :null;
    }

    );


    //Navigator.pop(context);
  }

  void getImageFromDeviceGalary() async{
    XFile? image_content = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 480,
        maxWidth: 480);

    String? item = await classifyImage(File(image_content!.path));
    food_item_amazon = await UploadImagetoS3(File(image_content!.path));
    setState(()
    {
      image_f =  File(image_content!.path);
      food_item = food_item_amazon;
      image_captured = true;
      calories = getCals(food_item_amazon);
      //String path = image_f.path!= null ? image_f.path :null;
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

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child : Padding(
            padding: const EdgeInsets.fromLTRB(0, 125, 0, 0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              image_f==null? Image(image: AssetImage('resources/default_cam.png')) : Image.file(image_f!,height: 300, width: 300, fit: BoxFit.cover,),
              /*
              Container(
              //[[camera Image],[click pick, select galary]]
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                height: 300,
                width: 300,
                alignment: Alignment.center,
                //decoration: BoxDecoration(color: Colors.grey[500],
                //border: Border.all(width: 8)
                //),
              ),
               */
              SizedBox(height: 30.0),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {getImageFromDeviceCam();},
                      child: const Text('Click Picture')
                    ),
                    ElevatedButton(
                      onPressed: () {getImageFromDeviceGalary();},
                      child: const Text('select Picture')
                    ),
                  ],
                ),
              ),
              Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('food item : $food_item'),
                        SizedBox(height: 10.0),
                        Text('food AMAZON item : $food_item_amazon'),
                        SizedBox(height: 10.0),
                        Text('Calories : $calories'),
                        SizedBox(height: 10.0),
                        Text('Add Ingredients'),

                      ]

                  )
              )

              ]
        ),
          ),
    ),
      )
    );
  }
}

