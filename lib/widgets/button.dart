import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String txt;
  final Color bgColor;
  final Color textColor;
  const MyButton(
      {super.key,
      required this.txt,
      required this.bgColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(45)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        child: Text(
          txt,
          style: TextStyle(
            fontSize: 22,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
