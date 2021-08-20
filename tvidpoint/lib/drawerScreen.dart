import 'package:flutter/material.dart';
import 'package:tvidpoint/contentScreen.dart';
import 'package:tvidpoint/menu_list.dart';

class DrawerScreen extends StatefulWidget {
  final Function closeDrawer;
  DrawerScreen(this.closeDrawer);
  @override
  _DrawerScreenState createState() => _DrawerScreenState(closeDrawer);
}

class _DrawerScreenState extends State<DrawerScreen> {
  final Function closeDrawer;
  _DrawerScreenState(this.closeDrawer);
  List<MenuList> menuList = getMenuItems();
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 140,
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[200],
            ),
            child: Center(
              child: Text(
                "Get the best from Youtube",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Divider(
            height: 40,
            color: Colors.blue[50],
            thickness: 1,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: menuList.length,
                itemBuilder: (context, index) {
                  return getItem(menuList[index], index);
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Colors.grey[200],
            ),
            child: Center(
              child: Text(
                "Enjoy the best Tutorials",
                style: TextStyle(fontSize: 20, color: Colors.grey[700], fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Widget getItem(MenuList item, int index) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              toContentPage(index);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  item.listItem,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          Divider(
            height: 20,
            color: Colors.blue[50],
            thickness: 1,
          ),
        ],
      ),
    );
  }

  toContentPage(int index) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ContentScreen(index)));
    closeDrawer();
  }
}
