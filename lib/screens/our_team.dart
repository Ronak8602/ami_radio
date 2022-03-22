import 'package:ami_radio/widgets/static_text.dart';
import 'package:flutter/material.dart';
import 'package:ami_radio/utilities/constants.dart';

import 'discussion_forum.dart';

class Ourteam extends StatelessWidget {
  const Ourteam({Key? key}) : super(key: key);

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
            'Our Team',
            style: appBarTextStyle,
          ),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.chat_bubble_outline_rounded),
              color: Colors.blue.shade800,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const DiscussionForum()));
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                StaticText(
                    text: "Prof. (Dr) Sumit Narula - Station Head - Ami Radio"),
                Divider(thickness: 1.5, color: Colors.grey),
                StaticText(text: "Dr.Manish Dubey - Content Producer"),
                Divider(thickness: 1.5, color: Colors.grey),
                StaticText(text: "Ms.Harshika Varma - Content Producer"),
                Divider(thickness: 1.5, color: Colors.grey),
                StaticText(text: "Dr.Pranav Mishra - Show Producer"),
                Divider(thickness: 1.5, color: Colors.grey),
                StaticText(text: "Mr.Siddharth Sharma - Editor"),
                Divider(thickness: 1.5, color: Colors.grey),
                StaticText(text: "Dr.Dinesh Sharma - Technical Lead"),
                Divider(thickness: 1.5, color: Colors.grey),
                StaticText(text: "Mr. Arun Singh Tomar - Technical Lead"),
              ],
            ),
          ),
        ));
  }
}
