import 'package:flutter/material.dart';

class SecondCardElementWidget extends StatelessWidget {
  final String date;
  final String moneyEarned;
  const SecondCardElementWidget({
    super.key,
    required this.date,
    required this.moneyEarned,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.055,
      child: Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.4,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                date,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.00,
            child: VerticalDivider(
              color: const Color(0xFFFBBC05),
              endIndent: MediaQuery.of(context).size.height * 0.01,
              indent: MediaQuery.of(context).size.height * 0.01,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.4,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '$moneyEarned zł',
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.05,
          //   width: MediaQuery.of(context).size.width * 0.05,
          //   child: VerticalDivider(
          //     color: const Color(0xFFFBBC05),
          //     endIndent: MediaQuery.of(context).size.height * 0.01,
          //     indent: MediaQuery.of(context).size.height * 0.01,
          //   ),
          // ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.05,
          //   width: MediaQuery.of(context).size.width * 0.2,
          //   child: IconButton(
          //     icon: const Icon(Icons.arrow_forward),
          //     color: Colors.blue,
          //     onPressed: () {},
          //   ),
          // ),
        ],
      ),
    );
  }
}
