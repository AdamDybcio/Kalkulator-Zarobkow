part of 'summary_data_bloc.dart';

abstract class SummaryDataState {
  List<Data> allData;
  SummaryDataState({required this.allData});
}

class SummaryDataInitial extends SummaryDataState {
  SummaryDataInitial({required List<Data> allData}) : super(allData: allData);
}

class SummaryDataUpdated extends SummaryDataState {
  SummaryDataUpdated({required List<Data> allData}) : super(allData: allData);
}
