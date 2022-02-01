import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/view_wrapper.dart';
import 'package:portfolio_website/widgets/navigation_arrow.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double screenWidth;
  double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return ViewWrapper(desktopView: desktopView(), mobileView: mobileView());
  }

  Widget desktopView() {
    return Stack(
      children: [
        NavigationArrow(isBackArrow: false),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(getFontSize(true)),
                  SizedBox(height: screenHeight * 0.05),
                  subHeader('Programmer ', getFontSize(false)),
                  SizedBox(height: screenHeight * 0.01),
                  subHeader('Flutter Enthusiast', getFontSize(false)),
                  SizedBox(height: screenHeight * 0.01),
                  subHeader('Full Stack Developer', getFontSize(false)),
                  SizedBox(height: screenHeight * 0.1),
                ],
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            profilePicture()
          ],
        )
      ],
    );
  }

  Widget mobileView() {
    return Column(
      children: [
        profilePicture(),
        SizedBox(height: screenHeight * 0.02),
        header(30),
        SizedBox(height: screenHeight * 0.01),
        subHeader('Programmer -Flutter Enthusiast -Full Stack Developer ', 19)
      ],
    );
  }

  double getImageSize() {
    if (screenWidth > 900 && screenHeight > 1200) {
      return 600;
    } else if (screenWidth > 600 && screenHeight > 1000) {
      return 550;
    } else if (screenWidth > 400 && screenHeight > 650) {
      return 400;
    } else {
      return 300;
    }
  }

  double getFontSize(bool isHeader) {
    double fontSize = screenWidth > 750 && screenHeight > 400 ? 15 : 10;
    return isHeader ? fontSize * 1.5 : fontSize;
  }

  Widget profilePicture() {
    return Container(
      child: PhysicalModel(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.black,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(3),
        child: FadeInImage.assetNetwork(
          // height: MediaQuery.of(context).size.height * 35,
          width: MediaQuery.of(context).size.width * 0.18,
          image: 'assets/picture.png',
          placeholder: "hey",
        ),
      ),
    );
  }

  Widget header(double fontSize) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontFamily: 'DMSerifDisplay'),
        children: <TextSpan>[
          //TextSpan(text: ' !!')
          TextSpan(
              //padding: Padding(
              text: 'Welcome to Portfolio',
              style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 39,
              )),
          TextSpan(
              text: "!!\n",
              style: TextStyle(color: Colors.white, fontSize: 46)),
          TextSpan(
              text: "\nShweta Singh, \nPre-final year Student\n",
              style: TextStyle(fontSize: 20, color: Colors.white)),
          TextSpan(
              text: "B.Tech(CSE), IIIT Lucknow",
              style: TextStyle(color: Colors.white, fontSize: 20))
        ],
      ),
    );
  }

  Widget subHeader(String text, double fontSize) {
    return Text(
      text,
      style: //ThemeSelector.selectSubHeadline(context)
          TextStyle(color: Colors.grey[500], fontSize: fontSize),
    );
  }
}
