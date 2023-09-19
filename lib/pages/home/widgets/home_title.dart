import 'package:flutter/material.dart';
import 'package:quiz/apps/utils/const.dart';

class HomeTitle extends StatelessWidget{
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Let's Play Quiz Game",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: getHeight(context) * 0.04),
        const Text('Go to programing test'),
        SizedBox(height: getHeight(context) * 0.04),
      ],
    );
  }

}
