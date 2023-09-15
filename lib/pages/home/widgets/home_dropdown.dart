import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/models/category_model.dart';
import 'package:quiz/providers/category_provider.dart';

class HomeDropdown extends StatelessWidget{
  const HomeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    List<Category> listLanguage = context.watch<CategoryProvider>().listLanguage;
    return DropdownButton(
      value: context.watch<CategoryProvider>().idLanguage,
      hint: const Text("Choice your language",
          style: TextStyle(color: Colors.white),
      ),
      isExpanded: true,
      style: const TextStyle(
        color: Colors.black,
      ),
      items: listLanguage.map((Category value) {
        return DropdownMenuItem(
          value: value.id,
          child: Text(value.name,
          style: const TextStyle(
            color: Color(0xff44A3AE)
          ),),
        );
      }).toList(),
      onChanged: (value) {
         context.read<CategoryProvider>().setIdLanguageChoice(value as int);
      },
    );
  }

}