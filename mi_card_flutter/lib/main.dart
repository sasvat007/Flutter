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
                  backgroundImage: AssetImage('images/photo.jpg'),
                  radius: 50.0,
                ),
                Text('SASVAT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0
                  ),
                ),
                Text('FLUTTER DEVELOPER',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 5.0
                  ),
                ),
                SizedBox(height: 50.0,
                  width: 250.0,
                  child: Divider(),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text('+91 9597446044'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text('sasvat007@gmail.com'),
                  ),
                )
              ],

            )
        ),
      )
    );
  }
}

