import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final List<Widget> children;
  const BackgroundWidget({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: SweepGradient(
                center: FractionalOffset.center,
                colors: [
                  Color(0xFFFBBC05),
                  Color(0xFFFFFFFF),
                  Color(0xFFFBBC05),
                  Color(0xFFFFFFFF),
                  Color(0xFFFBBC05),
                ],
                stops: <double>[0.0, 0.25, 0.5, 0.75, 1.0],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
