import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/bloc/add_data_bloc/add_data_bloc.dart';
import '/bloc/summary_data_bloc/summary_data_bloc.dart';

import '/models/data_model.dart';

class FirstCardAddWidget extends StatelessWidget {
  final AddDataBloc bloc;
  final SummaryDataBloc summaryDataBloc;
  const FirstCardAddWidget({
    required this.bloc,
    super.key,
    required this.summaryDataBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.4,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: BlocBuilder<AddDataBloc, AddDataState>(
              builder: (context, state) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.date),
                      VerticalDivider(
                        color: Colors.blue,
                        indent: MediaQuery.of(context).size.height * 0.01,
                        endIndent: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                          '${(state.hours * state.rate).toStringAsFixed(2)} zł'),
                    ],
                  ),
                );
              },
              bloc: bloc,
            ),
          ),
        ),
        BlocBuilder<SummaryDataBloc, SummaryDataState>(
          builder: (context, state) {
            return TextButton(
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'DODAJ',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onPressed: () {
                summaryDataBloc.add(
                  AddToSummaryEvent(
                    data: Data(
                      date: bloc.state.date,
                      hours: bloc.state.hours,
                      rate: bloc.state.rate,
                    ),
                  ),
                );
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.blue,
                    elevation: 10,
                    content: Center(
                      child: Text(
                        'Dodano pomyślnie!',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          bloc: summaryDataBloc,
        ),
      ],
    );
  }
}
