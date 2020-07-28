import 'package:flutter/material.dart';

class AnimatedElevationButton extends StatefulWidget {

  final Widget child;
  AnimatedElevationButton({this.child});

  @override
  _AnimatedElevationButtonState createState() =>
      _AnimatedElevationButtonState();
}

class _AnimatedElevationButtonState extends State<AnimatedElevationButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animationTween;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 30),
      vsync: this,
    );
    _animationTween =
        Tween(begin: 20.0, end: 0.0).animate(_animationController);
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: Material(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8.0),
        elevation: _animationTween.value,
        child: widget.child,
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _animationController.reverse();
  }
}