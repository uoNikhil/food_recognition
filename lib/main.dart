import 'package:flutter/material.dart';
import 'package:food_recognition/pages/login_page.dart';
import 'package:food_recognition/pages/overview.dart';
import 'package:food_recognition/pages/details.dart';
import 'package:food_recognition/pages/image_capture.dart';


void main() {
  return runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => login(),
      '/overview': (context) => overview(),
      '/details' : (context) => details(),
      '/imgcap' : (context) => CamCap(),
    },
  ));
}