import 'package:flutter/material.dart';
import 'package:quiz/apps/routers/routers.dart';
import 'package:provider/provider.dart';
import 'package:quiz/providers/category_provider.dart';
import 'package:quiz/providers/question_provider.dart';

class Myapp extends StatelessWidget{
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CategoryProvider()..getListLanguage(),
        ),
        ChangeNotifierProvider(
          create: (_) => QuestionProvider(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme:ThemeData.light().copyWith(
            useMaterial3: true,
            textTheme: const TextTheme(
                bodyMedium: TextStyle(
                    color: Colors.white
                )
            )
        ) ,
        routerConfig: RouterConfigCustom.router,
      ),
    );
  }
}
