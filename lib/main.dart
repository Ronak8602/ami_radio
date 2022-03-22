import 'package:ami_radio/screens/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(InitialApp());
}

class InitialApp extends StatelessWidget {
  InitialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ami Radio",
      home: Scaffold(body: SignInScreen()),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito Sans',
      ),
      builder: EasyLoading.init(),
    );
  }
}
