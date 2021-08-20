import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tvidpoint/homeScreen.dart';
import 'package:tvidpoint/onboardingScreen.dart';
import 'package:tvidpoint/signIn.dart';
import 'package:tvidpoint/utilities/utilityFunctions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    systemNavigationBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async {
      bool bb, b = await Utilties.getFlagOfOnBoardScreen();
      bb = await Utilties.getSignedInStatus();
      if (b) {
        if (bb) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen0()));
        } else {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SignIn()));
        }
      } else {
        Utilties.setFlagForOnBoardScreen();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => OnBoarding()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets\\tvid_logo.png",
                height: 250,
                width: 250,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SpinKitRing(
            color: Colors.black,
            lineWidth: 3,
          ),
        ],
      ),
    );
  }
}
