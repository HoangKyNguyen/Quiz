import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quiz/apps/utils/const.dart';
import 'package:quiz/models/category_model.dart';
import 'package:quiz/pages/home/widgets/home_warn.dart';
import 'package:quiz/providers/category_provider.dart';
import 'package:quiz/widgets/button_custom.dart';

import '../../../apps/routers/router_name.dart';


class HomeDropdown extends StatelessWidget{
  const HomeDropdown({Key? key}) : super(key: key);
  void handleStart(BuildContext context){
    var idLanguage = context.read<CategoryProvider>().idLanguage;
    if (idLanguage == null) {
      showModalNotify(context);
    } else {
      context.goNamed(RoutersName.categoryName);
    }
  }
  @override
  Widget build(BuildContext context) {
    List<Category> listLanguage = context.watch<CategoryProvider>().listLanguage;
    return Column(
      children: [
        DropdownButton(
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
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            context.read<CategoryProvider>().setIdLanguageChoice(value as int);
          },
        ),
        SizedBox(height: getWith(context)*0.04),
        ButtonCustom(
            title: "GetStart", 
            onTap: ()=> handleStart(context)
        )
      ],
    );
  }
}

