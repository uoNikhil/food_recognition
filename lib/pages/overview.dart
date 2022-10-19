import 'package:flutter/material.dart';


class overview extends StatefulWidget {
  const overview({Key? key}) : super(key: key);

  @override
  State<overview> createState() => _overviewState();
}

class _overviewState extends State<overview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[50],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[500],
        title: Text('OverView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(

          // This contains all type of meals
            child : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  //THis contains details of meals For BreakFast
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  color: Colors.grey[50],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(child: Icon(Icons.free_breakfast))
                      ),
                      Expanded(
                          flex: 5,
                          child: Container(child: Text('BreakFast', style: TextStyle(fontSize: 21.0)))
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(child: IconButton(onPressed: () {
                            Navigator.pushNamed(context, '/imgcap');
                          }, icon: Icon(Icons.add_circle)))
                      )
                    ],
                  ),
                ),

                Container(
                  //THis contains details of meals for Lunch
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  color: Colors.grey[100],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(child: Icon(Icons.lunch_dining_sharp))
                      ),
                      Expanded(
                          flex: 5,
                          child: Container(
                              child: Text('Lunch', style: TextStyle(fontSize: 21.0))
                          )
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(child: IconButton(onPressed: () {}, icon: Icon(Icons.add_circle)))
                      )
                    ],
                  ),
                ),
                Container(
                  //THis contains details of meals for snacks
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(child: Icon(Icons.fastfood))
                      ),
                      Expanded(
                          flex: 5,
                          child: Container(
                              child: Text('Snacks', style: TextStyle(fontSize: 21.0))
                          )
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(child: IconButton(onPressed: () {}, icon: Icon(Icons.add_circle)))
                      )
                    ],
                  ),
                ),
                Container(
                  //THis contains details of meals for snacks
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  color: Colors.grey[350],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(child: Icon(Icons.dinner_dining))
                      ),
                      Expanded(
                          flex: 5,
                          child: Container(
                              child: Text('Dinner', style: TextStyle(fontSize: 21.0))
                          )
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(child: IconButton(onPressed: () {}, icon: Icon(Icons.add_circle)))
                      )
                    ],
                  ),
                ),
              ],
            )
    )
    )
    );
  }
}
