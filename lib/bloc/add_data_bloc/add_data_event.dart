part of 'add_data_bloc.dart';

abstract class AddDataEvent {
  const AddDataEvent();
}

class ChangeDateEvent extends AddDataEvent {
  final String date;

  const ChangeDateEvent({required this.date});
}

class ChangeHoursEvent extends AddDataEvent {
  final int hours;

  const ChangeHoursEvent({required this.hours});
}

class ChangeRateEvent extends AddDataEvent {
  final double rate;

  const ChangeRateEvent({required this.rate});
}
