import 'package:flutter/material.dart';

extension EasyContext on BuildContext {
  void navigateAndPop(Widget page) => Navigator.of(this).push(
        MaterialPageRoute(builder: (_) => page),
      );
}
