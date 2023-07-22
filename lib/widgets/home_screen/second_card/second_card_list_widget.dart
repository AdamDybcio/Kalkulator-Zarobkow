import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '/models/data_model.dart';

import '/bloc/summary_data_bloc/summary_data_bloc.dart';

import 'second_card_element_widget.dart';

class SecondCardListWidget extends StatelessWidget {
  final SummaryDataBloc summaryDataBloc;
  const SecondCardListWidget({super.key, required this.summaryDataBloc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.8,
      child: BlocBuilder<SummaryDataBloc, SummaryDataState>(
        builder: (context, state) {
          Map<String, String> finalData = _sortAllData(state.allData);
          if (finalData.isEmpty) {
            return Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.6,
                child: const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text('Jeszcze nic tutaj nie ma 🤯')),
              ),
            );
          }
          return ListView.builder(
            itemCount: finalData.keys.length,
            itemBuilder: (context, index) {
              return SecondCardElementWidget(
                date: '${DateFormat('MMMM', 'pl').format(
                      DateTime(
                        0,
                        int.parse(
                          finalData.keys.elementAt(index).substring(4),
                        ),
                      ),
                    ).toUpperCase()} ${finalData.keys.elementAt(index).substring(0, 4)}',
                moneyEarned: finalData.values.elementAt(index),
              );
            },
          );
        },
        bloc: summaryDataBloc,
      ),
    );
  }
}

Map<String, String> _sortAllData(List<Data> allData) {
  Map<String, String> finalData = {};
  for (final item in allData) {
    String date = item.date;
    int month = int.parse(date.substring(3, 5));
    int year = int.parse(date.substring(6, 10));
    String id = "$year$month";
    if (!finalData.keys.contains(id)) {
      finalData.addAll({id: (item.hours * item.rate).toStringAsFixed(2)});
    } else {
      finalData.update(
          id,
          (value) => (double.parse(value) + item.hours * item.rate)
              .toStringAsFixed(2));
    }
  }
  finalData = Map.fromEntries(finalData.entries.toList()
    ..sort((a, b) => int.parse(b.key).compareTo(int.parse(a.key))));
  return finalData;
}
