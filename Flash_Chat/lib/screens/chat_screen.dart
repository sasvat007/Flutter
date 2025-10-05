import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late String message;
  final _auth = FirebaseAuth.instance;
  late User loggeduser;
  final _firestore=FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcurrentuser();
  }

  void getcurrentuser() async{
    try {
      final user = await _auth.currentUser;
      if (user != null) {
          loggeduser=user;
          print(loggeduser.email);
      }
    }catch(e){
      print(e);
    }

  }

  void messagestream() async{
    await for (var snapshot in _firestore.collection('messages').snapshots()){
      for (var messages in snapshot.docs){
        print(messages.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //_auth.signOut();
                //Navigator.pop(context);
                messagestream();
                //Implement logout functionality
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection("messages").orderBy('timestamp',descending: true).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.blue,
                      ),
                    );
                  }

                  final messages = snapshot.data!.docs;
                  List<messagebubble> messagewidget = [];

                  for (var message in messages) {
                    final data = message.data() as Map<String, dynamic>;
                    final text = data['text'] ?? "";
                    final sender = data['sender'] ?? "";
                    final widget = messagebubble(text: text, sender: sender,isme: loggeduser.email==sender,);
                    messagewidget.add(widget);
                  }

                  return ListView(
                    reverse: true,
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    children: messagewidget,
                  );
                },
              ),
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        message = value;

                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (message.trim().isNotEmpty) {
                        _firestore.collection('messages').add({
                          'text': message,
                          'sender': loggeduser.email,
                          'timestamp':FieldValue.serverTimestamp(),
                        });
                      }
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class messagebubble extends StatelessWidget {
  String text;
  String sender;
  bool isme;

  messagebubble({required this.text,required this.sender,required this.isme});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: isme ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children:[
          Text(sender),
          Material(
          borderRadius: isme ? BorderRadius.only(topLeft: Radius.circular(30.0),bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0)) :
              BorderRadius.only(topRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0)),
          elevation: 15.0,
          color: isme ? Colors.lightBlueAccent : Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              child: Text(
                text,
                style: TextStyle(
                  color: isme ? Colors.white : Colors.black54,
                  fontSize: 15.0
                ),
              )

          )
        )
      ]),
    );

  }
}

