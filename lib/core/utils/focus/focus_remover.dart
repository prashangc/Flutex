import 'package:flutter/material.dart';

class CustomFocusRemover {
  static void removeFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
