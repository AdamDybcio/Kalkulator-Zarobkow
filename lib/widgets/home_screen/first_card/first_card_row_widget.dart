import 'package:flutter/material.dart';

import '/bloc/add_data_bloc/add_data_bloc.dart';

import 'first_card_row_button_widget.dart';

class FirstCardRowWidget extends StatelessWidget {
  final String text;
  final Icon icon;
  final AddDataBloc bloc;
  const FirstCardRowWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.4,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.1,
            child: const Icon(Icons.arrow_forward),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.1,
            child: VerticalDivider(
              color: Colors.blue,
              endIndent: MediaQuery.of(context).size.height * 0.01,
              indent: MediaQuery.of(context).size.height * 0.01,
            ),
          ),
          FirstCardRowButtonWidget(
            icon: icon,
            bloc: bloc,
            text: text,
          ),
        ],
      ),
    );
  }
}
