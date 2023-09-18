import 'package:flutter/material.dart';
import '../../../apps/utils/const.dart';

Future<void> showModalNotify(context, String valueInput) => showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => FractionallySizedBox(
              heightFactor: 0.9,
              child: Container(
                width: getWith(context),
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                children: [
                                  TextSpan(
                                      text:
                                          'You must be choice the Language to Start',
                                      style: TextStyle(
                                          fontSize: 50, color: Colors.red))
                                ]))
                      ],
                    ))
                  ],
                ),
              ),
            ));
