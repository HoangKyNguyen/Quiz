import 'package:flutter/material.dart';
import 'package:quiz/apps/utils/const.dart';
import 'package:quiz/models/question_model.dart';
Future<void> showModal(context, String valueInput, Question data)=> showModalBottomSheet(
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
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     (valueInput.isEmpty)
                         ? nullAnswer(valueInput)
                         : (valueInput == data.answer)
                         ? correctAnswer(valueInput)
                         : errorAnswer(valueInput, data.answer)
                   ],
                 )
             )
           ],
         ),
       ),
    )
);
RichText nullAnswer(String valueInput){
  return RichText(
       textAlign: TextAlign.center,
      text: const TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          children: [
            TextSpan(
                text: 'You must be answer first',
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.red
                )
            )
          ]
      )
  );
}

RichText correctAnswer(String valueInput){
  return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        children: [
          const TextSpan(text: "Your result"),
          const WidgetSpan(child: SizedBox(width: 10)),
          TextSpan(
            text: valueInput,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 22,
            )
          ),
          const WidgetSpan(child: SizedBox(width: 10)),
          const TextSpan(text: 'is Corrected'),
          const WidgetSpan(child: SizedBox(width: 10)),
          const TextSpan(
              text: ' Success fully',
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.red
              )
          )
        ]
      )
  );
}

Center errorAnswer(String valueInput, answer){
  return Center(
    child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
            children: [
              const TextSpan(text: "Your result"),
              const WidgetSpan(child: SizedBox(width: 10)),
              TextSpan(
                  text: valueInput,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 22,
                  )
              ),
              const WidgetSpan(child: SizedBox(width: 10)),
              const TextSpan(text: 'Incorrect ! The correct answer: '),
              const WidgetSpan(child: SizedBox(width: 10)),
              TextSpan(
                text: answer.toString(),
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 22
                )
              ),
              const WidgetSpan(child: SizedBox(width: 10)),
              const TextSpan(
                text: ' Failure Answer',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.red
                )
              )
            ]
        )
    ),
  );
}

