import 'package:flutter/material.dart';

class details extends StatefulWidget {
  const details({Key? key}) : super(key: key);

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[50],
      appBar: AppBar(
        backgroundColor: Colors.redAccent[500],
        title: Text('Details'),
        centerTitle: true,
      ),
    );
  }
}
