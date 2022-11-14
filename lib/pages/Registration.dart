import 'package:flutter/material.dart';
import 'package:food_recognition/pages/login_page.dart';

class registration extends StatefulWidget{
  const registration({Key? key}) : super(key: key);

  @override
  _registrationState createState() => _registrationState();
}

class _registrationState extends State<registration>{

  @override
  Widget build(BuildContext context){

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.purple[100],
      body : Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            height: h,
            width: w,

            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                Text(
                "Register Here",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Create a new account here",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[600]
                ),
              ),

              SizedBox(height: 50,),

              //User ID
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                      focusedBorder : OutlineInputBorder(
                        borderSide : BorderSide(
                          color:Colors.purple,
                          width:1.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      prefixIcon: Icon(Icons.person_outline),
                      hintText: 'User ID',
                      fillColor: Colors.grey[200],
                      filled: true
                  ),
                ),
              ),

              SizedBox(height: 15,),

              //User Name
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                      focusedBorder : OutlineInputBorder(
                        borderSide : BorderSide(
                          color: Colors.purple,
                          width:1.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      prefixIcon: Icon(Icons.person),
                      hintText: 'User Name',
                      fillColor: Colors.grey[200],
                      filled: true
                  ),
                ),
              ),

              SizedBox(height: 15,),

              //Email
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                      focusedBorder : OutlineInputBorder(
                        borderSide : BorderSide(
                          color:Colors.purple,
                          width:1.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Email',
                      fillColor: Colors.grey[200],
                      filled: true
                  ),
                ),
              ),

              SizedBox(height: 15,),

              //Password
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                      focusedBorder : OutlineInputBorder(
                        borderSide : BorderSide(
                          color:Colors.purple,
                          width:1.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Password',
                      fillColor: Colors.grey[200],
                      filled: true
                  ),
                ),
              ),

              SizedBox(height: 15,),

              //Confirm Password
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                      focusedBorder : OutlineInputBorder(
                        borderSide : BorderSide(
                          color:Colors.purple,
                          width:1.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Confirm Password',
                      fillColor: Colors.grey[200],
                      filled: true
                  ),
                ),
              ),

              SizedBox(height: 15,),

              // Register button
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: ElevatedButton(
                    child: const Text('Login'),
                  onPressed: (){},
                  ),
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(25)
                ),
              ),

              // Linking the registration and the login page
              Container(
                child:Row(
                  mainAxisAlignment:  MainAxisAlignment.center,
                  children:[
                    Text("Do you have an account already?"),
                    Container(
                      child: ElevatedButton(

                        child: const Text('Login'),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => login()));
                        },
                      ),
                    )
                  ],
                ),
              ),
                ]

          ),
            ),

          ),
      ],


    )
    );
  }

}


