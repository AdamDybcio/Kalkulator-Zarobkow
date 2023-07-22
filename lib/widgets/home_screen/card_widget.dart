import 'dart:async';

import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  final bool isRight;
  final Widget child;
  const CardWidget({super.key, required this.isRight, required this.child});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation _showAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    Timer(const Duration(milliseconds: 500), () {
      _controller.forward();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _showAnimation = Tween(begin: 1.5, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.05,
                left: widget.isRight
                    ? MediaQuery.of(context).size.width * _showAnimation.value
                    : 0,
                right: !widget.isRight
                    ? MediaQuery.of(context).size.width * _showAnimation.value
                    : 0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  if (_showAnimation.value <= 1.0)
                    const BoxShadow(
                      offset: Offset(0, 0),
                      color: Colors.blue,
                      blurRadius: 10,
                      spreadRadius: 4,
                    ),
                ],
              ),
              child: widget.child,
            ),
          );
        },
      ),
    );
  }
}
