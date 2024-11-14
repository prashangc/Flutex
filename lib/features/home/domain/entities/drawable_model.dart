import 'package:flutter/material.dart';

class DrawableModel {
  final String title;
  final IconData iconData;
  final bool? isLogout;

  const DrawableModel({
    required this.title,
    this.isLogout,
    required this.iconData,
  });
}
