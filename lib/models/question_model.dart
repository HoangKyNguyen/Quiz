import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Question{
  int id;
  String? title;
  String question;
  String answer;
  Question({
        required this.id,
        this.title =" What is the result of this code under ?",
        required this.question,
        required this.answer,
  });

  Map<String,dynamic> toMap(){
     return<String,dynamic>{
       'id':id,
       'title':title,
       'question':question,
       'answer':answer
     };
  }

  factory Question.fromMap(Map<String,dynamic> map){
    return Question(
        id: map['id'] as int,
        title:map['title'] != null
            ?  map['title'] as String
            : " What is the result of this code under ?",
        question: map['question'] as String,
        answer: map['answer'] as String,
    );
  }
  String toJson() => json.encode(toMap());
   factory Question.fromJson(String source) =>
        Question.fromMap(json.decode(source) as Map<String,dynamic>);
}