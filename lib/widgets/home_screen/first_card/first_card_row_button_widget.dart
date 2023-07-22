import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

import '/bloc/add_data_bloc/add_data_bloc.dart';

class FirstCardRowButtonWidget extends StatelessWidget {
  const FirstCardRowButtonWidget({
    super.key,
    required this.icon,
    required this.bloc,
    required this.text,
  });

  final Icon icon;
  final AddDataBloc bloc;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.2,
      child: IconButton(
        icon: icon,
        color: const Color(0xFFFBBC05),
        onPressed: () async {
          if (text.contains("DZIEŃ")) {
            await calendarButton(context).then(
              (value) {
                if (value != null) {
                  bloc.add(
                    ChangeDateEvent(
                      date: DateFormat('dd.MM.yyyy').format(
                        DateTime(value.year, value.month, value.day),
                      ),
                    ),
                  );
                }
              },
            );
          }
          if (text.contains("GODZIN")) {
            // ignore: use_build_context_synchronously
            hourButton(context, bloc);
          }
          if (text.contains("STAWKĘ")) {
            // ignore: use_build_context_synchronously
            rateButton(context, bloc);
          }
        },
      ),
    );
  }

  Future<DateTime?> calendarButton(BuildContext context) {
    return showDatePicker(
      context: context,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFFBBC05),
              onPrimary: Colors.white,
              onSurface: Color(0xFFFBBC05),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
            ),
          ),
          child: child!,
        );
      },
      locale: const Locale('pl'),
      initialDate: DateTime(
          int.parse(bloc.state.date.split('.').last),
          int.parse(bloc.state.date.split('.')[1]),
          int.parse(bloc.state.date.split('.').first)),
      firstDate: DateTime(2023, 1, 1),
      lastDate: DateTime(2040, 12, 31),
    );
  }
}

Future<void> hourButton(BuildContext context, AddDataBloc bloc) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const FittedBox(
          fit: BoxFit.fitWidth,
          child: Text('Wybierz ilość godzin'),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  return NumberPicker(
                    minValue: 0,
                    maxValue: 24,
                    value: bloc.state.hours,
                    onChanged: (value) {
                      bloc.add(ChangeHoursEvent(hours: value));
                    },
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBBC05).withOpacity(0.4),
                    ),
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text(
              'ZAMKNIJ',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> rateButton(BuildContext context, AddDataBloc bloc) async {
  TextEditingController textEditingController = TextEditingController();
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const FittedBox(
          fit: BoxFit.fitWidth,
          child: Text('Wybierz stawkę'),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              BlocBuilder<AddDataBloc, AddDataState>(
                bloc: bloc,
                builder: (context, state) {
                  return TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText:
                          'Poprzednio: ${bloc.state.rate.toStringAsFixed(2)} zł',
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'(^\d*\.?\d*)'),
                      ),
                    ],
                    onTapOutside: (_) {
                      String temp = textEditingController.text.toString();
                      if (temp != '') {
                        String temp2 = double.parse(temp).toStringAsFixed(2);
                        double temp3 = double.parse(temp2);
                        bloc.add(ChangeRateEvent(rate: temp3));
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text(
              'ZAMKNIJ',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
