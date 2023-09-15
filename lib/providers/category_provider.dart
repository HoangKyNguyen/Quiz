import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../repositories/category_repo.dart';


class CategoryProvider extends ChangeNotifier{
   int ? idLanguage;
   List<Category> listLanguage =[];

   Future<void> getListLanguage() async{
     List<Category> data = await CategoryRepository().getLanguage();
     listLanguage =data;
     notifyListeners();
   }

   void setIdLanguageChoice(int id){
      idLanguage = id;
      notifyListeners();
   }

   Future<List<Category>> getListTopic() async{
      List<Category> data = await CategoryRepository().getTopic(idLanguage as int);
      return data;
   }
}