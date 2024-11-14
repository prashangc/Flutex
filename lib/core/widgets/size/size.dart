import 'package:flutter/material.dart';

double maxHeight(context) => MediaQuery.of(context).size.height;
double maxWidth(context) => MediaQuery.of(context).size.width;
Orientation orientation(context) => MediaQuery.of(context).orientation;
Widget sizedBox2() => const SizedBox(height: 2.0, width: 2.0);
Widget sizedBox8() => const SizedBox(height: 8.0, width: 8.0);
Widget sizedBox12() => const SizedBox(height: 12.0, width: 12.0);
Widget sizedBox16() => const SizedBox(height: 16.0, width: 16.0);
Widget sizedBox18() => const SizedBox(height: 18.0, width: 18.0);
Widget sizedBox20() => const SizedBox(height: 20.0, width: 20.0);
Widget sizedBox24() => const SizedBox(height: 24.0, width: 24.0);
Widget sizedBox32() => const SizedBox(height: 32.0, width: 32.0);
