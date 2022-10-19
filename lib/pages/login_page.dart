import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  String username = '';
  String password = '';
  String autherr = '';

  var _untextController = TextEditingController();
  var _pswdtextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent[50],
      appBar: AppBar(
        title: Text('Food Detection'),
        backgroundColor: Colors.blue[100],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // This is for UserName
              TextField(
                controller: _untextController,
                decoration: InputDecoration(
                    hintText: 'UserName',
                    border: OutlineInputBorder(),
                    suffix: IconButton(
                      onPressed: () { _untextController.clear();},
                      constraints: BoxConstraints(maxHeight: 36),
                      //padding: new EdgeInsets.all(5.0),
                      //padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                      icon: Icon(Icons.clear)
                  )
                ),
              ),

              SizedBox(height: 20.0),

              //This is for password
              TextField(
                controller: _pswdtextController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                    suffix: IconButton(
                        onPressed: () { _pswdtextController.clear();},
                        constraints: BoxConstraints(maxHeight: 36),
                        //padding: new EdgeInsets.all(5.0),
                        //padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                        icon: Icon(Icons.clear)
                    )
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      username = _untextController.text;
                      print('userName = $username');
                      password = _pswdtextController.text;
                      print('password = $password');
                    });
                    //Todo
                    // have authentication Validation through API
                    if(username == 'user1' && password == 'password123') {
                      Navigator.pushNamed(context, '/overview');
                    }
                    else
                    {
                      setState(() {
                        autherr = 'Invalid Password or Username';
                      });
                    }
                  },
                  child: const Text('Login'),
              ),
              Expanded(child: Container(
                height: 20,
                child: Center(
                  child: Text(autherr),
                ),
              )),
            ],
          )

        ),
      ),
    );
  }
}
