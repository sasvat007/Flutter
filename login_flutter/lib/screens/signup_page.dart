import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_flutter/screens/app_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(height: 70.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100.0),
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 70.0,
                      left: 70.0,
                      right: 70.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "E-mail",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Hello@gmail.com",
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        SizedBox(height: 30.0),
                        Text(
                          "Password",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: ".........",
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          onChanged: (value) {
                            passwd = value;
                          },
                        ),
                        SizedBox(height: 50.0),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 40.0,
                            right: 40.0,
                          ),
                          child: MaterialButton(
                            elevation: 20.0,
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              try {
                                await _auth
                                    .createUserWithEmailAndPassword(
                                      email: email,
                                      password: passwd,
                                    );
                              } catch (e) {
                                print(e);
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AppPage(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?"),
                            MaterialButton(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
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
