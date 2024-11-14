import 'package:flutter/material.dart';

class Nav {
  static final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

  static get navKey => _navKey;

  static final BuildContext? _context = _navKey.currentContext;

  static get context => _context;

  static push({required String route, Object? arguments}) async {
    final result =
        await Navigator.pushNamed(context, route, arguments: arguments);
    return result;
  }

  static void pop() {
    Navigator.of(_context!).pop();
  }
}
