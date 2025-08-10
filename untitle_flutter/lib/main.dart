import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/diamond.png'),
                radius: 50.0,
              ),
              Text('Diamond',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text('Flutter Development',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 5.0
                ),
              ),
              SizedBox(
                height: 50.0,
                width: 250.0,
                child: Divider(
                  thickness: 1.0,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+41 44447 65214',
                    style: TextStyle(
                      fontSize: 15.0
                    ),
                  ),

                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email_outlined,
                    color: Colors.teal,
                  ),
                  title: Text('diamond@gmail.com',
                    style: TextStyle(
                      fontSize: 15.0
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}


