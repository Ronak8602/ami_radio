import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import '../widgets/static_text.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

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
            'Contact Us',
            style: appBarTextStyle,
          ),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Center(
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
                  children: [
                    // Divider(thickness: 1.5, color: Colors.grey),
                    Image.asset('assets/images/contact.webp'),
                    Center(
                      child: StaticText(
                        text:
                            'Dr. Sumit Narula 9560452625'
                      ),
                    ),
                    // Divider(thickness: 1.5, color: Colors.grey),
                  ]),
            ),
          ),
        ));
  }
}
