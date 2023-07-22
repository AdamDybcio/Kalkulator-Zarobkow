import 'package:flutter/material.dart';
import 'package:tikej_app/bloc/summary_data_bloc/summary_data_bloc.dart';

import '/widgets/home_screen/second_card/second_card_data_widget.dart';
import '/widgets/home_screen/first_card/first_card_data_widget.dart';
import '/widgets/home_screen/card_widget.dart';
import '/widgets/home_screen/title_widget.dart';
import '/widgets/root_widgets/background_widget.dart';

class HomeScreen extends StatelessWidget {
  final SummaryDataBloc summaryDataBloc;
  const HomeScreen({super.key, required this.summaryDataBloc});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      children: [
        const TitleWidget(),
        CardWidget(
          isRight: true,
          child: FirstCardWidget(
            summaryDataBloc: summaryDataBloc,
          ),
        ),
        CardWidget(
          isRight: false,
          child: SecondCardWidget(
            summaryDataBloc: summaryDataBloc,
          ),
        ),
      ],
    );
  }
}
