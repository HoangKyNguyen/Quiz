import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/apps/routers/router_name.dart';
import 'package:quiz/pages/article/article_page.dart';
import 'package:quiz/pages/category/category_page.dart';
import 'package:quiz/pages/home/home_page.dart';
class RouterConfigCustom{
  static final GoRouter router =GoRouter(
     routes: <RouteBase>[
       GoRoute(
           path:RoutersPath.homePath,
           builder: (BuildContext context, GoRouterState state){
              return const HomePage();
           },
           routes: <RouteBase>[
             GoRoute(
                 name: RoutersName.categoryName,
                 path: RoutersPath.categoryPath,
                 builder:(BuildContext context, GoRouterState state){
                   return const CategoryPage();
                 },
               routes: <RouteBase>[
                 GoRoute(
                     name: RoutersName.articleName,
                     path: RoutersPath.articlePath,
                   builder:(BuildContext context, GoRouterState state){
                     return const ArticlePage();
                   },
                 ),
               ]
             )
           ],
       ),
     ]
  );
}