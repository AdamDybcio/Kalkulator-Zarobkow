import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';

part 'add_data_event.dart';
part 'add_data_state.dart';

class AddDataBloc extends HydratedBloc<AddDataEvent, AddDataState> {
  AddDataBloc() : super(AddDataInitial()) {
    on<ChangeDateEvent>(_getDate);
    on<ChangeHoursEvent>(_getHours);
    on<ChangeRateEvent>(_getRate);
  }

  void _getDate(ChangeDateEvent event, Emitter<AddDataState> emit) {
    state.date = event.date;
    emit(
        AddDataUpdated(date: state.date, hours: state.hours, rate: state.rate));
  }

  void _getHours(ChangeHoursEvent event, Emitter<AddDataState> emit) {
    state.hours = event.hours;
    emit(
        AddDataUpdated(date: state.date, hours: state.hours, rate: state.rate));
  }

  void _getRate(ChangeRateEvent event, Emitter<AddDataState> emit) {
    state.rate = event.rate;
    emit(
        AddDataUpdated(date: state.date, hours: state.hours, rate: state.rate));
  }

  @override
  AddDataState? fromJson(Map<String, dynamic> json) {
    return AddDataUpdated(
      date: state.date,
      hours: json['hours'],
      rate: json['rate'],
    );
  }

  @override
  Map<String, dynamic>? toJson(AddDataState state) {
    return {
      'hours': state.hours,
      'rate': state.rate,
    };
  }
}
