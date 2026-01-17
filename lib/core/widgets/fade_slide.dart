import 'package:flutter/material.dart';

class FadeSlide extends StatelessWidget {
  final Widget child;
  final int delay;
  const FadeSlide({super.key, required this.child, this.delay = 0});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 30.0, end: 0.0),
      duration: Duration(milliseconds: 500 + delay),
      curve: Curves.easeOut,
      builder: (BuildContext context, double value, Widget? childWidget) {
        return Transform.translate(
          offset: Offset(0.0, value),
          child: Opacity(opacity: (30.0 - value) / 30.0, child: child),
        );
      },
      child: child,
    );
  }
}
