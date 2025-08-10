import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home:Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            title: Center(child: Text('Ask Me Anything',
            style:TextStyle(
              color: Colors.white))),
            backgroundColor: Colors.blue[800],
          ),
          body: Boxpage(),
        )
      ),
    );

class Boxpage extends StatefulWidget {
  const Boxpage({super.key});

  @override
  State<Boxpage> createState() => _BoxpageState();
}

class _BoxpageState extends State<Boxpage> {
  int ballimg=1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
              child:TextButton(
                onPressed: (){
                  setState(() {
                    ballimg=Random().nextInt(4)+1;
                  });
                  print("ball is pressed");
                },
                child: Image(
                    image: AssetImage("images/ball$ballimg.png"),
                ),
              )
          )
        ],
      ),
    );
  }
}
