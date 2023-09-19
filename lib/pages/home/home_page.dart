import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/apps/routers/router_name.dart';
import 'package:quiz/apps/utils/const.dart';
import 'package:quiz/pages/home/widgets/home_dropdown.dart';
import 'package:quiz/pages/home/widgets/home_title.dart';
import 'package:quiz/widgets/background_custom.dart';
import 'package:quiz/widgets/button_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String ?dropdownValue ;

  void handleStart(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundCustom(),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingCustom(context)),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeTitle(),
                  HomeDropdown(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

