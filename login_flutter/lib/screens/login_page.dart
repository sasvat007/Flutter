import 'package:flutter/material.dart';
import 'package:login_flutter/const.dart';
import 'app_page.dart';
import 'signup_page.dart';
import 'user_not.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;

  late String email;

  late String passwd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Center(
                child: Icon(
                  Icons.person_outline_rounded,
                  color: Colors.white,
                  size: 200.0,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100.0),
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 50.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("E-mail", style: textstyle),
                            TextField(
                              decoration: InputDecoration(
                                hintText: "Hello@gmail.com",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              onChanged: (value) {
                                email = value;
                              },
                            ),
                            SizedBox(height: 10.0),
                            Text("Password", style: textstyle),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: ".......",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 40.0,
                                ),
                              ),
                              onChanged: (value) {
                                passwd = value;
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 50.0,
                          left: 50.0,
                          right: 50.0,
                        ),
                        child: MaterialButton(
                          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          color: Colors.black,
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () async {
                            try {
                              await _auth.signInWithEmailAndPassword(
                                email: email,
                                password: passwd,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AppPage(),
                                ),
                              );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'invalid-credential') {
                                showModalBottomSheet(
                                  context: context,
                                  builder: errorSheet,
                                );
                              } else {
                                print(e.code);
                              }
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have a account?"),
                          MaterialButton(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupPage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
