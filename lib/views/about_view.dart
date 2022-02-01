import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/theme_selector.dart';
import 'package:portfolio_website/utils/view_wrapper.dart';
import 'package:portfolio_website/widgets/bullet_list.dart';
import 'package:portfolio_website/widgets/navigation_arrow.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key key}) : super(key: key);

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView>
    with SingleTickerProviderStateMixin {
  double screenWidth;
  double screenHeight;
  String loremIpsum1 = "GSSoC'20 -"
      "I was participant of Open Source program called GirlScript"
      " Summer of Code. There, I "
      "contributed to projects, Water Monitoring App,Travel Safe, "
      "DS-Algo website etc";

  String loremIpsum2 = 'Club Lead - Club Lead of GeeksforGeeks Student '
      'Chapter-IIIT Lucknow of Session-1 (2020-21)';
  String loremIpsum3 = 'Campus Ambassador - CA at GeeksforGeeks for Session '
      '2020-21, I worked with like-minded people on technological task. I '
      'believe students helping others is a powerful technique '
      'to stay motivated and '
      'responsibile towards work.';
  String loremIpsum4 = 'Member of Software Wing - Member of technical club '
      'Axios, IIIT Lucknow, worked on mobile applications project. ';

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return ViewWrapper(
      desktopView: desktopView(),
      mobileView: mobileView(),
    );
  }

  Widget desktopView() {
    return Stack(
      children: [
        NavigationArrow(isBackArrow: false),
        NavigationArrow(isBackArrow: true),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 1),
            Expanded(flex: 3, child: infoSection()),
            Spacer(flex: 1),
            Expanded(
                flex: 3,
                child: BulletList(
                  strings: [
                    loremIpsum1,
                    loremIpsum2,
                    loremIpsum3,
                    loremIpsum4,
                  ],
                )),
            Spacer(flex: 1),
          ],
        )
      ],
    );
  }

  Widget mobileView() {
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.05),
        infoText(),
        SizedBox(height: screenHeight * 0.05),
        Container(
          height: screenHeight * 0.3,
          child: BulletList(
            strings: [
              loremIpsum1,
              loremIpsum2,
              loremIpsum3,
              loremIpsum4,
              //loremIpsum5,
              // loremIpsum6,
              // loremIpsum7,
            ],
          ),
        ),
      ],
    );
  }

  Widget infoSection() {
    return Container(
      width: screenWidth * 0.35,
      child: Column(
        children: [
          profilePicture(),
          SizedBox(height: screenHeight * 0.05),
          infoText()
        ],
      ),
    );
  }

  Widget profilePicture() {
    return Container(
      height: getImageSize(),
      width: getImageSize(),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(getImageSize() / 2),
          child: Container(
            color: Colors.grey,
            child: FadeInImage.assetNetwork(
              // height: MediaQuery.of(context).size.height * 35,
              width: MediaQuery.of(context).size.width * 0.18,
              image: 'assets/picture2.png',
              placeholder: "hey",
              // fit: BoxFit.fill,
            ), //

            // Center(child: Text('PLACEHOLDER IMAGE')),
          )),
    );
  }

  double getImageSize() {
    if (screenWidth > 1600 && screenHeight > 800) {
      return 350;
    } else if (screenWidth > 1300 && screenHeight > 600) {
      return 300;
    } else if (screenWidth > 1000 && screenHeight > 400) {
      return 200;
    } else {
      return 150;
    }
  }

  Widget infoText() {
    return Text(
      'Currently, I am persuing B.Tech via CSE '
      'from Indian Institute of Information Technology, Lucknow.'
      'I am energetic and enthusiastic person in the field of Technology, especially in Mobile Application Developement. '
      'I can build mobile apps using trending technology flutter and dart.'
      '\n     Naah, I am not expert using this framework and language but at '
      'intermediate level and can build fantastic apps.'
      'I also love contributing Open Source and public projects.'
      '\n\n\nSkills- C++, JAVA, Dart, C, Flutter, Firebase, Git/Github, API,'
      '\n\nHobbies- Photography, Cycling, Reading, Travelling ',
      overflow: TextOverflow.clip,
      style: ThemeSelector.selectBodyText(context),
    );
  }
}
