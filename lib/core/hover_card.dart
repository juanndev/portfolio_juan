import 'package:flutter/material.dart';

class HoverCard extends StatefulWidget {
  final Widget child;

  const HoverCard({super.key, required this.child});

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutBack,
        transform: _isHovered ? (Matrix4.identity()..translate(0.0, -8.0)) : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              // A OTIMIZAÇÃO: Animamos apenas a opacidade do verde (de 0% para 15%)
              color: const Color(0xFF2ECC71).withOpacity(_isHovered ? 0.15 : 0.0),
              // Mantemos o raio e o eixo fixos para não travar o WebGL!
              blurRadius: 30,
              offset: const Offset(0, 15),
            )
          ],
        ),
        child: widget.child,
      ),
    );
  }
}