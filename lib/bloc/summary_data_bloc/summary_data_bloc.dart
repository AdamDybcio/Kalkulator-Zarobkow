import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';

import '/models/data_model.dart';

part 'summary_data_event.dart';
part 'summary_data_state.dart';

class SummaryDataBloc extends HydratedBloc<SummaryDataEvent, SummaryDataState> {
  SummaryDataBloc() : super(SummaryDataInitial(allData: [])) {
    on<AddToSummaryEvent>(_addToSummary);
  }

  void _addToSummary(AddToSummaryEvent event, Emitter<SummaryDataState> emit) {
    List dates = state.allData.map((e) => e.date).toList();
    if (dates.contains(event.data.date)) {
      int tempIndex = dates.indexWhere((element) => element == event.data.date);
      state.allData.removeAt(tempIndex);
      state.allData.insert(tempIndex, event.data);
    } else {
      state.allData.add(event.data);
    }
    emit(SummaryDataUpdated(allData: state.allData));
  }

  @override
  SummaryDataState? fromJson(Map<String, dynamic> json) {
    final allDataMap = jsonDecode(json['data']) as List;
    final allDataList =
        allDataMap.map((dataMap) => Data.fromJson(dataMap)).toList();
    return SummaryDataUpdated(allData: allDataList);
  }

  @override
  Map<String, dynamic>? toJson(SummaryDataState state) {
    final allDataMap = state.allData.map((data) => data.toJson()).toList();
    return {'data': jsonEncode(allDataMap)};
  }
}
