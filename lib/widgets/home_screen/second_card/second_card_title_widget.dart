import 'package:flutter/material.dart';

class SecondCardTitleWidget extends StatelessWidget {
  const SecondCardTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.4,
      child: const FittedBox(
        fit: BoxFit.fitWidth,
        child: Center(
          child: Text(
            'PODSUMOWANIE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    );
  }
}
