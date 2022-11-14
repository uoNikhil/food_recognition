import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:uuid/uuid.dart';

import 'package:path/path.dart';
import 'package:async/async.dart';



final lambdaURL = "User your URL here";
Future<String?> test(File? image) async
{
  if(image==null) {
    return null;
  }
  final File imageFile = image;

  var response = await http.get(Uri.parse(lambdagetURL));
  var json_data = jsonDecode(response.body);
  //var food = List<Map<String,Object>>.from(json_data["lable"]).toList();
  print(json_data);
  var food_item = json_data['lable'];
  return food_item;
}

Future<String?> UploadAndClassifyImage(File? image) async
{
  if(image==null) {
    return null;
  }
  final File imageFile = image;
  var request = http.MultipartRequest('POST', Uri.parse(lambdaPostURL));
  //var uuid = Uuid();
  //request.fields['ProductId'] = uuid.v1();
  request.files.add(http.MultipartFile.fromBytes('picture', File(image!.path).readAsBytesSync(),filename: image!.path));
  //var res = await request.send();
  http.Response response = await http.Response.fromStream(await request.send());
  print("Result: ${response.statusCode}");
  print("RESULT OF MultipartFile request***************************************************");
  print(response.body);
  return response.body;

  /*
  var json_data = jsonDecode(res);
  //var food = List<Map<String,Object>>.from(json_data["lable"]).toList();
  print(json_data);
  var food_item = json_data['lable'];
   */
  //return food_item;
}

Future<String?> UploadAndClassifyImage2(File? image) async
{
  if(image==null) {
    return null;
  }
  final File imageFile = image;



    var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();

    var uri = Uri.parse(lambdaPostURL);

    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path));
    //contentType: new MediaType('image', 'png'));

    request.files.add(multipartFile);
    var response = await request.send();
    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  //return food_item;
}

Future<String?> UploadImagetoS3v2(File? image) async {
  if(image==null) {
    return null;
  }

  final File imageFile = image;

  var uploadUri = "Use your S3 bucket link here";

  var filePath = image!.path;

  File file = File(filePath);
  List<int> imageData = file.readAsBytesSync();

  var response = await http.put(Uri.parse(uploadUri), body: imageData, headers: {
    "Content-Type": "octet-stream",
    "Content-Disposition": 'attachment; filename="resource"',
    "Content-Encoding": "identity",
    "Content-Length": file.lengthSync().toString()
  });

  if (response.statusCode == 201 || response.statusCode == 200 ) {
    print( 'response: ' + response.toString() );
  } else {
    throw Exception('Failed.....');
  }
  return "";
}

Future<String?> UploadImagetoS3(File? image) async
{
  if(image==null) {
    return null;
  }
  final File imageFile = image;

  var url = "Use your S3 bucket UrL here";
  var request = http.MultipartRequest('POST', Uri.parse(url));
  print("printing Image path ");
  print(image!.path);
  request.files.add(await http.MultipartFile.fromPath('file', image!.path));
  request.fields.addAll({'key':image!.path.split('/').last, 'acl':'public-read'});
  print("printing image path split");
  print(image!.path.split('/').last);
  print("printing Request string **********************");
  print(request.toString());
  var response = await request.send();


  print("printing Response string *********************");
  print(response.toString());
  if(response.reasonPhrase!=null) {
    print("Printing Reason Pharease");
    print(response.reasonPhrase);
  }
  var map = response.headers;
  print("printing response header map");
  map.forEach((key, value) {
    print("[{$key},{$value}");
  });



  print("Result: ${response.statusCode}");
  print("CHECK for image on S3***************************************************");


  /*
  var json_data = jsonDecode(res);
  //var food = List<Map<String,Object>>.from(json_data["lable"]).toList();
  print(json_data);
  var food_item = json_data['lable'];
   */
  //return food_item;
}

/*

 */