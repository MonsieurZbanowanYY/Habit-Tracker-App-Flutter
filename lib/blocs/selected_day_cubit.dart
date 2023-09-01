import 'package:bloc/bloc.dart';

class SelectedDayCubit extends Cubit<DateTime> {
  SelectedDayCubit() : super(DateTime.now());
  changeSelectedDay(DateTime newDay) => emit(newDay);
}
// Martin Gogołowicz || SobGOG || 01.09.2023
// Last edit: Martin Gogołowicz || SobGOG || 01.09.2023