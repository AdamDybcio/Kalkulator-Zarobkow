import 'dart:async';

import 'package:flutter/material.dart';

import '/bloc/summary_data_bloc/summary_data_bloc.dart';
import '/bloc/add_data_bloc/add_data_bloc.dart';

import '/widgets/home_screen/first_card/first_card_add_widget.dart';
import '/widgets/home_screen/first_card/first_card_row_widget.dart';

class FirstCardWidget extends StatefulWidget {
  final SummaryDataBloc summaryDataBloc;
  const FirstCardWidget({super.key, required this.summaryDataBloc});

  @override
  State<FirstCardWidget> createState() => _FirstCardWidgetState();
}

class _FirstCardWidgetState extends State<FirstCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation _showAnimation;
  final addBloc = AddDataBloc();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    Timer(const Duration(milliseconds: 1500), () {
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
                  FirstCardRowWidget(
                    text: 'WYBIERZ DZIEŃ',
                    icon: const Icon(
                      Icons.calendar_today,
                    ),
                    bloc: addBloc,
                  ),
                  FirstCardRowWidget(
                    text: 'WYBIERZ ILOŚĆ GODZIN',
                    icon: const Icon(
                      Icons.timelapse,
                    ),
                    bloc: addBloc,
                  ),
                  FirstCardRowWidget(
                    text: 'WYBIERZ STAWKĘ',
                    icon: const Icon(
                      Icons.euro,
                    ),
                    bloc: addBloc,
                  ),
                  Divider(
                    height: MediaQuery.of(context).size.height * 0.005,
                    color: Colors.blue,
                    indent: MediaQuery.of(context).size.width * 0.1,
                    endIndent: MediaQuery.of(context).size.width * 0.1,
                  ),
                  FirstCardAddWidget(
                    bloc: addBloc,
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
