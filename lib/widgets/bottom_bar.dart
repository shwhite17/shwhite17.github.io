import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/widgets/custom_icon_button.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Align(
            alignment: Alignment.center,
            child: Container(
              height: 2,
              width: screenWidth * 0.9,
              color: Colors.greenAccent,
            )),
        Container(
          height: screenHeight * 0.05,
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.05, right: screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomIconButton(
                      iconData: FontAwesomeIcons.twitter,
                      url: 'https://twitter.com/Shwhite17',
                      color: Colors.blueAccent,
                    ),
                    SizedBox(width: screenWidth * 0.021),
                    CustomIconButton(
                      iconData: FontAwesomeIcons.youtube,
                      url:
                          'https://www.youtube.com/channel/UC28HfP_aYS-MsHmwFz-IAQA',
                      color: Colors.red,
                    ),
                    SizedBox(width: screenWidth * 0.021),
                    CustomIconButton(
                      iconData: FontAwesomeIcons.github,
                      url: 'https://github.com/Shweta0617',
                      color: Colors.white,
                    ),
                    SizedBox(width: screenWidth * 0.021),
                    CustomIconButton(
                      iconData: FontAwesomeIcons.linkedin,
                      url: 'https://www.linkedin.com/in/shweta-singh-4902a8195',
                      color: Colors.blue,
                    )
                  ],
                ),
                Text('Made with Flutter Web \u00a9 2021',
                    style: TextStyle(
                        color: Colors.greenAccent, fontFamily: 'Barlow')),
                Text('shwhite0617@gmail.com', //Made with Flutter '
                    // 'Web \u00a9 2021'
                    style:
                        TextStyle(color: Colors.yellow, fontFamily: 'Barlow'))
              ],
            ),
          ),
        )
      ],
    );
  }
}
