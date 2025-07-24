import 'package:flutter/material.dart';

class AnimatedIntroText extends StatefulWidget {
  final String description;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;

  const AnimatedIntroText({
    super.key,
    required this.description,
    this.titleStyle,
    this.descriptionStyle,
  });

  @override
  State<AnimatedIntroText> createState() => _AnimatedIntroTextState();
}

class _AnimatedIntroTextState extends State<AnimatedIntroText> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _descOpacity;
  late final Animation<Offset> _descSlide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );


    _descOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
    );

    _descSlide = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 150,
      left: 0,
      right: 0,
      child: Column(
        children: [
          FadeTransition(
            opacity: _descOpacity,
            child: SlideTransition(
              position: _descSlide,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: widget.descriptionStyle ??
                      const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
