import 'package:bloc/bloc.dart';
import 'package:habitmate/models/habit_model.dart';
import 'package:habitmate/models/selected_day_model.dart';
import 'package:habitmate/repositories/habits.dart';

class SelectedDayCubit extends Cubit<SelectedDay> {
  SelectedDayCubit()
      : super(SelectedDay(selectedDay: DateTime.now(), habits: habits));
  changeSelectedDay(DateTime newDay) {
    List<Habit> newHabits = state.habits.toList();
    for (int i = 0; i < newHabits.length; i++) {
      Habit habit = newHabits[i].copyWith(isExpanded: false);
      newHabits[i] = habit;
    }
    emit(state.copyWith(selectedDay: newDay, habits: newHabits));
  }

  changeHabitExpanded(int index) {
    List<Habit> newHabits = state.habits.toList();
    Habit habit =
        newHabits[index].copyWith(isExpanded: !newHabits[index].isExpanded);
    newHabits[index] = habit;
    emit(state.copyWith(habits: newHabits));
  }

  changeHabitDone(int index) {
    List<Habit> newHabits = state.habits.toList();
    Habit habit = newHabits[index].copyWith(isDone: !newHabits[index].isDone);
    newHabits[index] = habit;
    emit(state.copyWith(habits: newHabits));
  }
}
// Martin Gogołowicz || SobGOG || 01.09.2023
// Last edit: Martin Gogołowicz || SobGOG || 02.09.2023