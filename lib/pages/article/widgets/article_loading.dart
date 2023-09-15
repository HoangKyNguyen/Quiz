import 'package:flutter/material.dart';
import 'package:quiz/apps/utils/const.dart';

class ArticleLoading extends StatelessWidget{
  const ArticleLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
           clipBehavior: Clip.hardEdge,
           width: getWith(context),
           height: getHeight(context)*0.05,
           decoration: BoxDecoration(
             borderRadius:  BorderRadius.circular(20),
             border: Border.all(
               width: 2,
               color: Colors.white,
             )
           ),
          child: Stack(
            children: [
              Container(
                width: getWith(context)*30/100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                      colors: [
                        Color(0xff44A3AE),
                        Color(0xff33FBC9),
                      ],
                  )
                ),
              ),
              const Positioned.fill(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Loading..."),
                          Icon(
                            Icons.timelapse,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      ),
                  )
              )
            ],
          ),
        ),
        SizedBox(
          height: getHeight(context)*0.04,
        ),
        RichText(
            text: const TextSpan(
              children: [
                TextSpan(text: 'Question'),
                TextSpan(text: '2'),
                TextSpan(text: '/'),
                TextSpan(text: '5'),
              ],
            )
        )
      ],
    );
  }

}