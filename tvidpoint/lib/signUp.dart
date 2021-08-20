import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:tvidpoint/utilities/notifyUtility.dart';
import 'package:tvidpoint/utilities/utilityFunctions.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final userIdController = TextEditingController();
  final userPassController = TextEditingController();
  String _email = "", _password = "";
  Future<void> _createUser() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
      await Utilties.setSignedInStatus();
      await Utilties.setUserId(userId: _email);
      Phoenix.rebirth(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Notify.notifyTheDialog(
            dialog: 'Email Already in Use', context: context);
      }
    } catch (e) {
      print('$e and this is the problem');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Card(
              elevation: 0,
              margin: EdgeInsets.only(left: 5.0, top: 40, right: 10),
              borderOnForeground: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              color: Colors.grey[200],
              child: Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(top: 20, right: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.grey[300],
                    border: Border.all(color: Colors.blue)),
                child: Container(
                  margin: EdgeInsets.only(top: 60),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0)),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0)),
                          color: Colors.grey[400],
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 80, 10.0),
                        child: Text(
                          "SignUp .",
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
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
                            color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: userPassController,
                    onChanged: (value) {
                      _password = value;
                    },
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                    decoration: InputDecoration(
                        labelText: "PASSWORD",
                        labelStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: Card(
          elevation: 0,
          margin: EdgeInsets.only(bottom: 60),
          color: Colors.transparent,
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
                String em = userIdController.text.toString().trim();
                String pass = userPassController.text.toString().trim();
                if (em.isNotEmpty && pass.isNotEmpty) {
                  _email = em;
                  _password = pass;
                  _createUser();
                } else {
                  Notify.notifyTheDialog(
                      dialog: 'Fill All the Fields', context: context);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "REGISTER",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    " - ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "NOW",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    userPassController.dispose();
    userIdController.dispose();
    super.dispose();
  }
}
