import 'package:ami_radio/utilities/constants.dart';
import 'package:flutter/material.dart';

import '../services/google_sign_in.dart';
import '../widgets/button_item.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.shade800,
                Colors.blue.shade200,
              ]),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/amiradioLogo.png',
                      height: 160,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'AMI RADIO',
                    style: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 40,
                    ),
                  ),
                  const Text(
                    'Developed by Ronak Prajapati',
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder(
              future: Authentication.initializeFirebase(context: context),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Error initializing Firebase');
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 48.0),
                    child: const GoogleSignInButton(),
                  );
                }
                return const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.orangeAccent,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
