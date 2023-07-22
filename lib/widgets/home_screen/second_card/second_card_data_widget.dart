import 'dart:async';

import 'package:flutter/material.dart';

import '/bloc/summary_data_bloc/summary_data_bloc.dart';

import '/widgets/home_screen/second_card/second_card_title_widget.dart';
import 'second_card_list_widget.dart';

class SecondCardWidget extends StatefulWidget {
  final SummaryDataBloc summaryDataBloc;
  const SecondCardWidget({super.key, required this.summaryDataBloc});

  @override
  State<SecondCardWidget> createState() => _SecondCardWidgetState();
}

class _SecondCardWidgetState extends State<SecondCardWidget>
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
    Timer(const Duration(milliseconds: 2000), () {
      _controller.forward();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _showAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.linear,
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
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.3,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Opacity(
              opacity: _showAnimation.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SecondCardTitleWidget(),
                  Divider(
                    height: MediaQuery.of(context).size.height * 0.005,
                    color: const Color(0xFFFBBC05),
                    indent: MediaQuery.of(context).size.width * 0.1,
                    endIndent: MediaQuery.of(context).size.width * 0.1,
                  ),
                  SecondCardListWidget(
                    summaryDataBloc: widget.summaryDataBloc,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
