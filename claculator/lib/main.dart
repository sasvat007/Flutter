import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String inpvalue = ""; // Removed 'const' and made it mutable
  String calvalue="";
  String operator="";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                inpvalue,
                style:  TextStyle(fontSize: 100, color: Colors.white),
              ),
            ),
            Row(
              children: [
                calbutton(context, "1", Colors.white38),
                calbutton(context, "2", Colors.white38),
                calbutton(context, "3", Colors.white38),
                calbutton(context, "/", Colors.orange),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                calbutton(context, "4", Colors.white38),
                calbutton(context, "5", Colors.white38),
                calbutton(context, "6", Colors.white38),
                calbutton(context, "*", Colors.orange),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                calbutton(context, "7", Colors.white38),
                calbutton(context, "8", Colors.white38),
                calbutton(context, "9", Colors.white38),
                calbutton(context, "-", Colors.orange),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                calbutton(context, "0", Colors.white38),
                calbutton(context, ".", Colors.white38),
                calbutton(context, "=", Colors.orange),
                calbutton(context, "+", Colors.orange),
              ],
            ),
            calbutton(context, "Clear", Colors.black),
          ],
        ),
      ),
    );
  }

  Widget calbutton(BuildContext context, String text, Color bgcol) {
    return InkWell(
      onTap: () {
        if (text=="Clear"){
          setState(() {
          inpvalue =""; // Corrected: moved into proper setState call
          });
        }
        else if (text=="+" || text=="-" || text=="*" || text=="/"){
          calvalue=inpvalue;
          inpvalue="";
          operator=text;
        }
        else if (text=="="){
          setState(() {
            double inp=double.parse(inpvalue);
            double cal=double.parse(calvalue);
            if (operator=="+"){
              inpvalue=(inp+cal).toString();
            }
            else if (operator=="-"){
              inpvalue=(cal-inp).toString();
            }
            else if (operator=="*"){
              inpvalue=(inp*cal).toString();
            }
            else if (operator=="/"){
              inpvalue=(cal/inp).toString();
            }
          });
        }
        else{
          setState(() {
            inpvalue=inpvalue+text;
          });
        }

      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:12.0),
        child: Container(
          decoration: BoxDecoration(
            color: bgcol,
            borderRadius: BorderRadius.circular(100),
          ),
          height: MediaQuery.of(context).size.width / 5,
          width: MediaQuery.of(context).size.width / 5,
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 30.0),
          ),
        ),
      ),
    );
  }
}
