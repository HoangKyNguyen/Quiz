import 'package:flutter/material.dart';

class ArticleTitle extends StatelessWidget{
  const ArticleTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 18,
        ),
        Text("streak"),
      ],
    );
  }

}