import 'package:flutter/material.dart';
import 'package:quiz/apps/routers/router.dart';
import 'package:provider/provider.dart';
import 'package:quiz/providers/category_provider.dart';
class Myapp extends StatelessWidget{
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => CategoryProvider()..getListLanguage(),
          )
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