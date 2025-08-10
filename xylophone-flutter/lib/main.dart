import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TextButton(
                  onPressed:(){},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.all(100.0)
                  ),
                  child: Text("Click me"))
            ],
          ),
        ),
      ),
    );
  }
}
