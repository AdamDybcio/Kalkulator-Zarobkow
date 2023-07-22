part of 'summary_data_bloc.dart';

abstract class SummaryDataEvent {
  const SummaryDataEvent();
}

class AddToSummaryEvent extends SummaryDataEvent {
  final Data data;

  AddToSummaryEvent({required this.data});
}
