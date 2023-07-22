part of 'add_data_bloc.dart';

abstract class AddDataState {
  String date;
  int hours;
  double rate;
  AddDataState(
    this.date,
    this.hours,
    this.rate,
  );
}

class AddDataInitial extends AddDataState {
  AddDataInitial()
      : super(
          '${DateFormat('dd').format(DateTime.now())}.${DateFormat('MM').format(DateTime.now())}.${DateTime.now().year}',
          0,
          0.00,
        );
}

class AddDataUpdated extends AddDataState {
  AddDataUpdated(
      {required String date, required int hours, required double rate})
      : super(date, hours, rate);
}
