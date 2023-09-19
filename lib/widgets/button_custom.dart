import 'package:flutter/material.dart';
import '../apps/utils/const.dart';

class ButtonCustom extends StatelessWidget{
  String title;
  Function onTap;
  ButtonCustom({Key? key, required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: ()=>onTap(),
        child: Container(
            padding:  EdgeInsets.symmetric(vertical: getHeight(context) * 0.02),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                gradient: LinearGradient(
                    colors: [
                      Color(0xff44A3AE),
                      Color(0xff33FBC9),
                    ]
                )
            ),
            width:getWith(context),
            child:  Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22
              ),
            )
        ),
      ),
    );
  }

}
