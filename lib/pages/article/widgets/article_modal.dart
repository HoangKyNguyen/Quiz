import 'package:flutter/material.dart';
import 'package:quiz/apps/utils/const.dart';
Future<void> showModal(context)=> showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context)=>FractionallySizedBox(
       heightFactor: 0.9,
       child: Container(
         width: getWith(context),
         padding:  const EdgeInsets.all(20.0),
         decoration: const BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.vertical(
             top:   Radius.circular(
                 20
             ),
           )
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Expanded(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     RichText(
                         text: const TextSpan(
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: 18,
                           ),
                           children: [
                             TextSpan(text: 'Your Answer'),
                             WidgetSpan(
                                 child: SizedBox(
                                   width: 5, // your of space
                                 )),
                             TextSpan(
                               text: '123',
                               style: TextStyle(
                                 color: Colors.green,
                                 fontSize: 22,
                               ),
                             ),
                             TextSpan(
                               text: '!The Correct Answer'
                             ),
                             WidgetSpan(
                                 child: SizedBox(
                                   width: 5, // your of space
                                 )),
                             TextSpan(
                               text: '12344567',
                               style: TextStyle(
                                 color: Colors.green,
                                 fontSize: 22,
                               )
                             )
                           ]
                         ),
                     ),
                     SizedBox(height: getHeight(context)*0.02),
                     RichText(
                         text: const TextSpan(
                           style: TextStyle(
                             color: Colors.red,
                             fontSize: 16,
                           ),
                           children: [
                             TextSpan(text: 'See more video solution to result'),
                           ],
                         ),
                     ),
                     SizedBox(height: getHeight(context)*0.02)
                   ],
                 )
             )
           ],
         ),
       ),
    )
);