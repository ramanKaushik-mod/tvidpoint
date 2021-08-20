import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:foldable_sidebar/foldable_sidebar.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:swipedetector/swipedetector.dart';
import 'package:tvidpoint/drawerScreen.dart';
import 'package:tvidpoint/lastHScroll.dart';
import 'package:tvidpoint/menu_list.dart';
import 'package:tvidpoint/utilities/utilityFunctions.dart';

class HomeScreen0 extends StatefulWidget {
  @override
  _HomeScreen0State createState() => _HomeScreen0State();
}

class _HomeScreen0State extends State<HomeScreen0> {
  String userID = '';

  FSBStatus status = FSBStatus.FSB_CLOSE;
  Future<bool> _exitApp() {
    SystemNavigator.pop();
    return Future.value(true);
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  void _getUser() async {
    userID = await Utilties.getUserId();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _exitApp,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            flexibleSpace: Container(color: Colors.white),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              contentPadding: EdgeInsets.all(0.0),
                              title: Text(
                                "LOGOUT | ",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              content: SingleChildScrollView(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: ListBody(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Are you sure, You want to logout?",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              actions: [
                                IconButton(
                                  icon: Icon(
                                    Icons.check,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () async {
                                    Utilties.clearEveryThing();
                                    await FirebaseAuth.instance.signOut();
                                    await Utilties.setFlagForOnBoardScreen();
                                    Phoenix.rebirth(context);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: Colors.blue[700],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      Navigator.of(context).pop();
                                    });
                                  },
                                )
                              ],
                            ));
                  }),
              IconButton(
                  icon: Icon(
                    Icons.verified_user,
                    color: Colors.grey[600],
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              contentPadding: EdgeInsets.all(0.0),
                              title: Text(
                                "USER ID | ",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              content: SingleChildScrollView(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: ListBody(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        userID,
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              actions: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  icon: Icon(Icons.close_rounded),
                                  color: Colors.blue,
                                )
                              ],
                            ));
                  }),
            ],
            elevation: 0,
            backgroundColor: Color.fromRGBO(68, 68, 65, 1),
          ),
          body: SwipeDetector(
            onSwipeLeft: () {
              setState(() {
                status = FSBStatus.FSB_CLOSE;
              });
            },
            onSwipeRight: () {
              setState(() {
                status = FSBStatus.FSB_OPEN;
              });
            },
            child: FoldableSidebarBuilder(
                drawerBackgroundColor: Colors.white,
                status: status,
                drawer: DrawerScreen(() {
                  setState(() {
                    status = FSBStatus.FSB_CLOSE;
                  });
                }),
                screenContents: HomeScreen()),
          ),
          floatingActionButton: status == FSBStatus.FSB_OPEN
              ? FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      status = status == FSBStatus.FSB_OPEN
                          ? FSBStatus.FSB_CLOSE
                          : FSBStatus.FSB_OPEN;
                    });
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.deepPurple[700],
                  ),
                  backgroundColor: Colors.white,
                )
              : FloatingActionButton(
                  elevation: 0,
                  onPressed: () {
                    setState(() {
                      status = status == FSBStatus.FSB_OPEN
                          ? FSBStatus.FSB_CLOSE
                          : FSBStatus.FSB_OPEN;
                    });
                  },
                  child: Icon(
                    Icons.menu_sharp,
                    color: Colors.deepPurple[700],
                  ),
                  backgroundColor: Colors.white,
                ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var list = getLScrollList();
  var listLs = getMenuItems();
  var listF = getFScrollList();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 160,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Learn at TVid.",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: AssetImage("assets\\tvid_logo.png"),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.blue[50],
                  height: 60,
                  thickness: 1,
                ),
                _titles("Recommended"),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  height: 440,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listF.length,
                    itemBuilder: (context, index) {
                      return getBox(listF[index]);
                    },
                  ),
                ),
                Divider(
                  color: Colors.blue[50],
                  height: 60,
                  thickness: 1,
                ),
                _titles("Available"),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listLs.length,
                    itemBuilder: (context, index) {
                      return getWideBox(listLs[index]);
                    },
                  ),
                ),
                Divider(
                  color: Colors.blue[50],
                  height: 60,
                  thickness: 1,
                ),
                _titles("Why & What you should try..."),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return getEWideBox(list[index]);
                    },
                  ),
                ),
                Divider(
                  color: Colors.blue[50],
                  height: 60,
                  thickness: 1,
                ),
                SizedBox(
                  height: 60,
                )
              ],
            )),
      ),
    );
  }

  Widget _titles(String title) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w300, color: Colors.black),
      ),
    );
  }

  Widget getBox(LastHScroll data) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[200],
      ),
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[200],
        ),
        height: 320,
        width: 280,
        child: Stack(
          children: [
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              elevation: 0,
              color: Colors.grey[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.title,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[600]),
                      ),
                      ClipRRect(
                          child: Image.asset(
                        data.imageUrl,
                        height: 60,
                        width: 60,
                      ))
                    ],
                  )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Card(
                  margin: EdgeInsets.only(
                      top: 110, left: 10, right: 10, bottom: 10),
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        data.description,
                        style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getWideBox(MenuList data) {
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color: Colors.deepPurpleAccent,
            )),
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Center(
            child: Text(
              data.listItem,
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ));
  }

  Widget getEWideBox(LastHScroll data) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 400,
        margin: EdgeInsets.all(5),
        width: (MediaQuery.of(context).size.width * 2) / 3,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Card(
              elevation: 0,
              margin: EdgeInsets.all(10),
              color: Colors.grey[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data.title,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600]),
                    ),
                    ClipRRect(
                      child: Image.asset(data.imageUrl, height: 80, width: 80),
                      borderRadius: BorderRadius.circular(10),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Card(
                  margin: EdgeInsets.only(
                      top: 120, left: 10, right: 10, bottom: 10),
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      data.description,
                      style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
