import 'dart:io';
import 'package:ami_radio/screens/about_us.dart';
import 'package:ami_radio/screens/our_team.dart';
import 'package:ami_radio/screens/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ami_radio/utilities/constants.dart';
import 'home_page.dart';

class BottomBar extends StatefulWidget {
  final int index;

  const BottomBar({Key? key, required User user, required this.index})
      : _user = user,
        super(key: key);

  final User _user;
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  DateTime? currentBackPressTime;
  late int currentIndex;
  late User _user;

  @override
  void initState() {
    super.initState();
    setState(() {
      currentIndex = widget.index;
    });
    _user = widget._user;
  }

  changeIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
        height: screenWidth * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                SizedBox(
                  width: screenWidth * .2125,
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex ? screenWidth * .12 : 0,
                      width: index == currentIndex ? screenWidth * .2125 : 0,
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? Colors.blueAccent.withOpacity(.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth * .2125,
                  alignment: Alignment.center,
                  child: Icon(
                    listOfIcons[index],
                    size: screenWidth * .076,
                    color: index == currentIndex
                        ? Colors.blue.shade800
                        : Colors.black26,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: WillPopScope(
        child: (currentIndex == 0)
            ? const HomePage()
            : (currentIndex == 1)
                ? const Ourteam()
                : (currentIndex == 2)
                    ? const AboutUs()
                    : Profile(user: _user),
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }

  bottomBarItem(icon, index) {
    return IconButton(
      icon: Icon(
        icon,
        size: 24.0,
        color: (index == currentIndex) ? Colors.blueAccent : greyColor,
      ),
      onPressed: () => changeIndex(index),
    );
  }
}

List<IconData> listOfIcons = [
  Icons.home_rounded,
  Icons.people,
  Icons.school,
  Icons.person,
];
