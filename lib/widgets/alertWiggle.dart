import 'dart:math';

import 'package:flutter/material.dart';

class AlertWiggle extends StatefulWidget {
  AlertWiggle({this.child});

  final Widget child;
  static final sinePeriod = 2 * pi;

  @override
  _AlertWiggleState createState() => _AlertWiggleState();
}

class _AlertWiggleState extends State<AlertWiggle> {
  double _endValue = 0;

  @override
  Widget build(BuildContext context) {
      return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: AlertWiggle.sinePeriod),
        duration: Duration(milliseconds: 200),
        child: widget.child,
        builder: (_, double value, Widget child) {
          double offset = sin(value);
          return Transform.translate(
            offset: Offset(0, offset * 2),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: value == 0 || value == _endValue ? 0 : 3,
              child: child,
            ),
          );
        },
      );
  }
}
