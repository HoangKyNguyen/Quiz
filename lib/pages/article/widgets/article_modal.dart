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
            ),
          ]
      )
  );
}

Column correctAnswer(String valueInput){
  return Column(
    children: [
      RichText(
          text: TextSpan(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              children: [
                const TextSpan(text: "Your answer"),
                const WidgetSpan(child: SizedBox(width: 10)),
                TextSpan(
                    text: valueInput,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 22,
                    )
                ),
                const WidgetSpan(child: SizedBox(width: 10)),
                const TextSpan(text:'is absolutely correct'),
                const WidgetSpan(child: SizedBox(width: 10)),
              ]
          )
      ),
      Image.network('https://th.bing.com/th?id=OIP.Nei_T1FVu2JF1f6104vl2gAAAA&w=246&h=253&c=8&rs=1&qlt=90&o=6&dpr=2&pid=3.1&rm=2')
    ]
  );
}

Center errorAnswer(String valueInput, answer){
  return Center(
    child: Column(
      children:[RichText(
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
              ]
          )
      ),
        Image.network('https://media.tenor.com/Fkeix5_Cv8UAAAAC/complete-failure-failure.gif')
      ] 
    ),
  );
}

