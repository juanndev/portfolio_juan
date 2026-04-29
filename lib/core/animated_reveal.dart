import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedReveal extends StatefulWidget {
  final Widget child;
  final String id;

  const AnimatedReveal({super.key, required this.child, required this.id});

  @override
  State<AnimatedReveal> createState() => _AnimatedRevealState();
}

class _AnimatedRevealState extends State<AnimatedReveal> {
  bool _hasAnimated = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.id),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.15 && !_hasAnimated) {
          if (mounted) {
            setState(() {
              _hasAnimated = true;
            });
          }
        }
      },
      child: _hasAnimated
          ? widget.child.animate()
              .fadeIn(duration: 800.ms, curve: Curves.easeOut)
              .slideY(begin: 0.1, end: 0, duration: 800.ms, curve: Curves.easeOut)
          : Opacity(
              opacity: 0, 
              child: widget.child,
            ),
    );
  }
}