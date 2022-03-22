import 'package:flutter/material.dart';

class StaticText extends StatelessWidget {
  final String text;
  const StaticText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
          textAlign: TextAlign.center),
    );
  }
}
