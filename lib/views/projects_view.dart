import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/project_model.dart';
import 'package:portfolio_website/utils/view_wrapper.dart';
import 'package:portfolio_website/widgets/navigation_arrow.dart';
import 'package:portfolio_website/widgets/project_entry.dart';
import 'package:portfolio_website/widgets/project_image.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({Key key}) : super(key: key);

  @override
  _ProjectsViewState createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  double screenWidth;
  double screenHeight;
  int selectedIndex = 0;
  List<Project> projects = [
    Project(
        title: 'Flutter Web',
        imageURL: 'project1.jpg',
        description: "Flu"
            "tter's web support, gives the same experiences on the web as on mobile. I "
            "tried out 'portfolio website' using flutter web and my experience was "
            "reallly good. \n\nPortfolio Includes -\n \n 1) It has 3 tabs 'Ho"
            "me'"
            ", 'About', "
            "and 'Project'.\n 2) At bottom of protfolio, there is social media "
            "connection handles to have formal conversation if needed.\n 3) Home "
            "Page- The tab is simple but soon i'll add some background "
            "animation"
            " to it. Tab contains an image, and a small intro."
            "\n 4) About "
            "Page- This tab  includes complete intro with experience and "
            "achievement section. \n 5) I added simple animation to this "
            "about  "
            "section and an "
            "image in circular view.\n 6) Project Page - That's the most "
            "interesting and "
            "beautiful section which has 3 projects with horizontal line sliding "
            "from \n 7) center of first project to centre of last projects. \n "
            "8) "
            "Projects section also include images with project naem and descript "
            "of projects in brief on that page,\n\n I'll soon add 2 other section "
            "with background effect to portfolio"),
    Project(
        title: 'Compass App',
        imageURL: 'project2.jpg',
        description: " The compass app can be used for direction, location and "
            "navigation. It's an app based on flutter and dart. Ui/Ux is "
            "quite simple but functions and features balance the app. \n\n"
            "Compass App includes -\n\n 1) App Shows the directions phone is "
            "pointing, users current location and elevation. \n 2) It Used "
            "Compass Tools for the app and also set-up environment. \n 3) "
            "Only works, if mobile phone has magnetic sensor. \n 4) Compass"
            " will display on-screen directions and degrees \n 5) "
            "Applications compass, digital compass to help you determine the "
            "direction quickly and accurately.\n\n Currently working on this "
            "app, soon add new features !!"
            " "),
    Project(
        title: 'Blog App',
        imageURL: 'project3.jpg',
        description:
            "Blog App is flutter and dart based app that helps bloggers to "
            "write his/her blogs and keep it safe and secure. Developing "
            "Flutter Blog App using Fire-base real time database and Firebase authentication\n\nBlog App "
            "includes -\n\n1) flutter firebase sign in, signout, and sign "
            "up using Firebase Authentication.\n2) App allow users to "
            "Add, Update, Delete New Posts using Firebase Real Time "
            "Database\n3) Fetch users posts from Firebase database and "
            "display it on home page\n4) Flutter Login Page & Flutter "
            "Register Page for our android and iOS blog app with firebase"
            " database which we are developing using flutter with "
            "firebase real  time database.\n5) we created and design home"
            " page for  our flutter blog app using firebase database and "
            "firebase authentication. \n6) we created create a alert "
            "dialog  box for displaying firebase authentication errors in"
            " case  of invalid inputs.\n7) we created upload image file "
            "from where  we will allow user to update a new blog post."
            "\n8) we allow  users to upload image to firebase using "
            "flutter.\n9) the flutter  blog app we will retrieve posts "
            "from database  and display it on home page "),
  ];

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
    double space = MediaQuery.of(context).size.height * 0.03;
    List<Widget> images =
        List.generate((projects.length * 1.5).ceil(), (index) {
      if (index.isEven) {
        return ProjectImage(
            project: projects[index ~/ 2],
            onPressed: () => updateIndex(index ~/ 2));
      } else {
        return SizedBox(height: space);
      }
    });
    return Stack(
      children: [
        NavigationArrow(isBackArrow: true),
        Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.05, horizontal: screenWidth * 0.1),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: images,
                ),
                SizedBox(width: space),
                Container(
                  height: screenHeight * 0.2 * 2 + space * 2,
                  //width: 5,
                  //color: Colors.white,

                  child: Stack(
                    children: [
                      AnimatedAlign(
                        alignment: selectedIndex == 0
                            ? Alignment.topCenter
                            : selectedIndex == 1
                                ? Alignment.center
                                : Alignment.bottomCenter,
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.fastOutSlowIn,
                        child: Container(
                          color: Colors.white,
                          width: screenWidth * 0.05,
                          height: 3,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: space,
                ),
                Expanded(
                    child: ProjectEntry(
                  project: projects[selectedIndex],
                ))
              ],
            ))
      ],
    );
  }

  Widget mobileView() {
    return Column(
      children: [],
    );
  }

  void updateIndex(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }
}
