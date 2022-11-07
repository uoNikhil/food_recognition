import 'package:google_ml_vision/google_ml_vision.dart';
//import 'package:flutter/material.dart';
import 'dart:io';
//import 'package:image_picker/image_picker.dart';

Future<String?> classifyImage(File? image) async
{
  if(image==null) {
    return null;
  }
  final File imageFile = image;
  final GoogleVisionImage visionImage = GoogleVisionImage.fromFile(imageFile);
  final ImageLabeler labeler = GoogleVision.instance.imageLabeler();
  final List<ImageLabel> labels = await labeler.processImage(visionImage);


  for (ImageLabel label in labels) {
    final String? text = label.text;
    final String? entityId = label.entityId;
    final double? confidence = label.confidence;
    if(text!=null && entityId!=null && confidence!=null)
      {
        print('text = $text  |  entityId = $entityId  |  confidence = $confidence');
      }
  }
  String? item = labels[0].text;
  return item;
}