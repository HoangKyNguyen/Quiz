import 'package:flutter/material.dart';

double getWith (context) => MediaQuery.sizeOf(context).width;
double getHeight (context) => MediaQuery.sizeOf(context).height;
double paddingCustom(context) => getWith(context)*0.06;
