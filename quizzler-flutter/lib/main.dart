
import 'quiz.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizbank q1=Quizbank();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scorekeeper=[];
  int rightanswer=0;
  int wronganswer=0;

  void checkanswer(bool userpickedanswer){
    bool correctanswer=q1.getquestionanswer();
    setState(() {

      if (q1.isFinished()==true){
        Alert(
          context: context,
          title: "Finished",
          desc: "You have reached the end of the quiz",
        ).show();

        Alert(
          context: context,
          title: "Correct/Wrong Answers",
          desc: "Correct:$rightanswer,Wrong:$wronganswer",
        ).show();

        q1.reset();
        scorekeeper=[];
        rightanswer=0;
        wronganswer=0;

      }

      else {
        if (userpickedanswer == correctanswer) {
          scorekeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ),);
          rightanswer++;
        }
        else {
          scorekeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
          wronganswer++;
        }
      }

      q1.checkquestion();

    });

  }





  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                q1.getquestiontext(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: MaterialButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkanswer(true);
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: MaterialButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkanswer(false);
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
