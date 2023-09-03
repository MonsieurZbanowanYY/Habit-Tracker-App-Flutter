import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:habitmate/models/habit_hive_model.dart';
import 'package:habitmate/models/habit_model.dart';
import 'package:habitmate/models/selected_day_model.dart';
import 'package:habitmate/repositories/habit_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SelectedDayCubit extends Cubit<SelectedDay> {
  SelectedDayCubit()
      : super(SelectedDay(selectedDay: DateTime.now(), habits: [])) {
    changeSelectedDay(
      DateTime.utc(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
    );
  }
  Future<void> changeSelectedDay(DateTime newDay) async {
    if (newDay == state.selectedDay) return;
    List<Habit> habits = [];
    Box<HabitHive> box = await Hive.openBox('habits');
    try {
      if (box.isEmpty) {
        // TODO: add a habit creation screen
        // code below is just for testing purposes
        final DateTime now = DateTime.now();
        await HabitRepository(box).addHabit(
          now.millisecondsSinceEpoch.toString(),
          HabitHive(
            name: 'Go for a walk',
            icon: Icons.directions_walk.codePoint,
            frequency: 'daily',
            goal: null,
            streak: 0,
            onlyOn: [],
            doneOn: [DateTime.utc(DateTime.now().year, DateTime.now().month)],
            createdAt: now,
            updatedAt: now,
          ),
        );
        // end of testing code
      } else {
        habits = HabitRepository(box).getHabitsForDate(newDay);
      }
    } catch (e) {
      // add error handling to crashlytics
    } finally {
      await box.close();
    }
    emit(state.copyWith(selectedDay: newDay, habits: habits));
  }

  void changeHabitExpanded(int index) {
    List<Habit> newHabits = state.habits.toList();
    Habit habit =
        newHabits[index].copyWith(isExpanded: !newHabits[index].isExpanded);
    newHabits[index] = habit;
    if (newHabits != state.habits) {
      emit(state.copyWith(habits: newHabits));
    }
  }

  Future<void> changeHabitDone(int index) async {
    List<Habit> newHabits = state.habits.toList();
    Habit habit = newHabits[index].copyWith(
      isDone: !newHabits[index].isDone,
    );
    Box<HabitHive> box = await Hive.openBox('habits');
    try {
      HabitHive? oldHabit = box.get(habit.id);
      if (oldHabit == null) return;
      List<DateTime> doneOn = oldHabit.doneOn.toList();
      if (habit.isDone) {
        doneOn.add(
          state.selectedDay,
        );
      } else {
        doneOn.remove(state.selectedDay);
      }
      await HabitRepository(box).updateHabit(
        habit.id,
        oldHabit.copyWith(
          doneOn: doneOn,
          updatedAt: DateTime.now(),
        ),
      );
      habit = habit.copyWith(
        doneOn: doneOn,
      );
      newHabits[index] = habit;
    } catch (e) {
      // add error handling to crashlytics
    } finally {
      await box.close();
    }
    if (newHabits != state.habits) {
      emit(state.copyWith(habits: newHabits));
    }
  }
}
// Martin Gogołowicz || SobGOG || 01.09.2023
// Last edit: Martin Gogołowicz || SobGOG || 03.09.2023
