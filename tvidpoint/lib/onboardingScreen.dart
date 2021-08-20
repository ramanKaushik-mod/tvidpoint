import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tvidpoint/data.dart';
import 'package:tvidpoint/signIn.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<SliderModel> slides = [];
  int currentPage = 0;

  PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    slides = getSlide();
  }

  Future<bool> _exitApp() {
    //use to exit from any position inside flutter app
    Future<bool> b = Future.value(false);
    SystemNavigator.pop();
    return b;
  }

  Widget pageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isCurrentPage ? Colors.grey : Colors.grey[200],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _exitApp,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: PageView.builder(
            controller: _pageController,
            onPageChanged: (val) {
              setState(() {
                currentPage = val;
              });
            },
            itemCount: slides.length,
            itemBuilder: (context, index) {
              return SliderTile(
                  imagePath: slides[index].getImagePath(),
                  title: slides[index].getTitle(),
                  description: slides[index].getDesc());
            }),
        bottomSheet: currentPage != slides.length - 1
            ? Container(
                color: Colors.grey[200],
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  height: 100,
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap: () {
                            _pageController.animateToPage(slides.length - 1,
                                duration: Duration(microseconds: 600),
                                curve: Curves.linearToEaseOut);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[700],
                              ),
                            ),
                          )),
                      Row(
                        children: [
                          for (int i = 0; i < slides.length; i++)
                            currentPage == i
                                ? pageIndicator(true)
                                : pageIndicator(false),
                        ],
                      ),
                      Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        color: Colors.grey[200],
                        child: IconButton(
                          
                          color: Colors.redAccent,
                          splashColor: Colors.red,
                          splashRadius: 20,
                            onPressed: () {
                              _pageController.animateToPage(currentPage + 1,
                                  duration: Duration(microseconds: 600),
                                  curve: Curves.easeInToLinear);
                            },
                            icon: Icon(Icons.arrow_forward_ios,color: Colors.red,)),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                margin: EdgeInsets.all(0),
                color: Colors.grey[200],
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      color: Colors.white),
                  alignment: Alignment.center,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        color: Colors.grey[900],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

class SliderTile extends StatefulWidget {
  final String imagePath, title, description;

  SliderTile(
      {required this.imagePath,
      required this.title,
      required this.description});

  @override
  _SliderTileState createState() => _SliderTileState();
}

class _SliderTileState extends State<SliderTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(70.0),
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(widget.imagePath)),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            widget.description,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
