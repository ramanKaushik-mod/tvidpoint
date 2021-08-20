import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:tvidpoint/signUp.dart';
import 'package:tvidpoint/utilities/notifyUtility.dart';
import 'package:tvidpoint/utilities/utilityFunctions.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final userIdController = TextEditingController();
  final userPassController = TextEditingController();
  String _email = "", _password = "";
  Future<bool> _exitApp() {
    SystemNavigator.pop();
    return Future.value(true);
  }

  Future<void> _login() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email.trim(), password: _password.trim());
      await Utilties.setSignedInStatus();
      await Utilties.setUserId(userId: _email);
      Phoenix.rebirth(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Notify.notifyTheDialog(
            dialog: 'Account already in use', context: context);
      } else if (e.code == 'wrong-password') {
        Notify.notifyTheDialog(dialog: 'Wrong Password', context: context);
      } else if (e.code == 'invalid-email') {
        Notify.notifyTheDialog(dialog: 'Invalid Email', context: context);
      }
    } catch (e) {
      Notify.notifyTheDialog(
          dialog: 'Check your Internet Connection', context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _exitApp,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                margin: EdgeInsets.only(left: 5.0, top: 40),
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Colors.grey[300],
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[300]),
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 40, 90, 0.0),
                        child: Text(
                          "Hello",
                          style: TextStyle(
                              fontSize: 60.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 100, 90, 0.0),
                        child: Text(
                          "There .",
                          style: TextStyle(
                              fontSize: 80.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300],
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: userIdController,
                        onChanged: (value) {
                          _email = value;
                        },
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.grey[700]),
                        decoration: InputDecoration(
                          labelText: "EMAIL",
                          labelStyle: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        controller: userPassController,
                        onChanged: (value) {
                          _password = value;
                        },
                        cursorColor: Colors.black,
                        style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                        decoration: InputDecoration(
                            labelText: "PASSWORD",
                            labelStyle: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue))),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          String em = userIdController.text.toString().trim();
                          String pass =
                              userPassController.text.toString().trim();
                          if (pass.isNotEmpty && em.isNotEmpty) {
                            _login();
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[700],
                          ),
                          child: Center(
                            child: Text(
                              "L-O-G-I-N",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
        bottomSheet: Container(
          color: Colors.grey[200],
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Card(
            margin: EdgeInsets.only(bottom: 60),
            color: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Container(
              height: 80.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[700]),
              padding: EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "New to TVid.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Center(
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Center(
                      child: Text(
                        "now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    userIdController.dispose();
    userPassController.dispose();
    super.dispose();
  }
}
