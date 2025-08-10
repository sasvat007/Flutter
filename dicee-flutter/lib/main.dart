import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[400],
        appBar: AppBar(
          title: Center(
            child: Text('Dicee',
                style: TextStyle(
                color: Colors.white
            ),
            ),
          ),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftdice = 1;
  int rightdice=1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed:(){
                    setState(() {
                      leftdice=Random().nextInt(6)+1;
                    });
                    print('Left is pressed');
                  },
                  child: Image.asset(
                    'images/dice$leftdice.png'
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      rightdice=Random().nextInt(6)+1;
                    });
                    print('Right is pressed');
                  },
                  child: Image(
                      image: AssetImage('images/dice$rightdice.png')
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 100.0),
          TextButton(
            onPressed: (){
              setState(() {
                leftdice=Random().nextInt(6)+1;
                rightdice=Random().nextInt(6)+1;
              });
            },
            child: Card(
              child: Text('Press',
                style: TextStyle(
                  fontSize: 100.0
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
