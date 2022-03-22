import 'package:ami_radio/screens/audio_player.dart';
import 'package:ami_radio/services/storage_service.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:ami_radio/utilities/constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../widgets/card_widget.dart';
import 'discussion_forum.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          leading: Expanded(
            child: Image.asset('assets/images/amiradioLogo.png'),
          ),
          centerTitle: true,
          elevation: 1.0,
          title: const Text(
            'Featured',
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
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            Card1(
              title: 'National Education Policy',
              content:
                  'The National Education Policy of India 2020 (NEP 2020) , which was approved by the Union Cabinet of India on 29 July 2020, outlines the vision of new education system of India. The new policy replaces the previous National Policy on Education 1986. The policy is a comprehensive framework for elementary education to higher education as well as vocational training in both rural and urban India.The policy aims to transform India’s education system by 2040. ',
              imagePath: 'assets/images/nep.png',
              category: 'national_education_policy',
            ),
            Card1(
              title: 'Science Communication',
              content:
                  'Science communication is  the practice of informing, educating, raising awareness of science-related topics, and increasing the sense of wonder about scientific discoveries and arguments.',
              imagePath: 'assets/images/science.jpg',
              category: 'science',
            ),
            Card1(
              title: 'Talent Speaks',
              content:
                  'Recognise your talent and let it speak out here. Public speaking, singing, playing an instrument , mimicry and anything else that you feel needs recognition  can be performed here. ',
              imagePath: 'assets/images/talent.jpeg',
              category: 'talent_speaks',
            ),
            Card1(
              title: 'Discussion Forum',
              content:
                  'Come forward and speak your mind at this discussion forum. Every viewpoint needs to be heard and this forum is for students to exchange their ideas and beliefs. Participate in discussions that matter and see things from a different perspective. This will also give them a chance to interact with celebrities and learn from their experiences. ',
              imagePath: 'assets/images/discussion.jpeg',
              category: 'discussion_forum',
            )
          ],
        ));
  }
}
