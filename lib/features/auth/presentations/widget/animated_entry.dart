import 'package:flutter/material.dart';

class AnimatedEntry extends StatelessWidget {
  final Widget child;
  final int delay;
  const AnimatedEntry({super.key, required this.child, this.delay = 0});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 30.0, end: 0.0),
      duration: const Duration(milliseconds: 500),
      builder: (context, value, _) {
        return Transform.translate(
          offset: Offset(0, value),
          child: Opacity(opacity: (30 - value) / 30, child: child),
        );
      },
    );
  }
}
