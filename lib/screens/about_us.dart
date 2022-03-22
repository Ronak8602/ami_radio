import 'package:ami_radio/widgets/static_text.dart';
import 'package:flutter/material.dart';
import 'package:ami_radio/utilities/constants.dart';

import 'discussion_forum.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Expanded(
            child: Image.asset('assets/images/amiradioLogo.png'),
          ),
          centerTitle: true,
          elevation: 1.0,
          backgroundColor: whiteColor,
          title: const Text(
            'About Us',
            style: appBarTextStyle,
          ),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.chat_bubble_outline_rounded),
              color: Colors.blue.shade800,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DiscussionForum()));
              },
            )
          ],
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.5),
              borderRadius: BorderRadius.circular(24.0),
            ),
            margin: const EdgeInsets.all(24.0),
            padding: const EdgeInsets.all(24.0),
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Divider(thickness: 1.5, color: Colors.grey),
                  Center(
                    child: StaticText(
                      text:
                          'AMI RADIO - A radio station available to you on the move, at the click of a button on your phone, is a Radio app brought together by students of Amity School of Communication, Amity University - Gwalior. This app and its various programmes are conceptualised by students and the aim is to give them a platform to bring out their creative sensibilities',
                    ),
                  ),
                  Divider(thickness: 1.5, color: Colors.grey),
                ]),
          ),
        ));
  }
}

/// Final about page

//
// SingleChildScrollView(
// child: Column(
// children: [
// Category(
// categoryName: "National Education Policies",
// imagePath: 'assets/images/nep.png',
// ),
// Category(
// categoryName: "Swara Bhaskar",
// imagePath: 'assets/images/nep.png',
// ),
// Category(
// categoryName: "Yashpal Sharma",
// imagePath: 'assets/images/nep.png',
// ),
// ],
// ),
// )
