import 'package:bloc/bloc.dart';
import 'package:habitmate/models/habit_hive_model.dart';
import 'package:habitmate/models/new_habit_model.dart';
import 'package:habitmate/repositories/habit_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NewHabitCubit extends Cubit<NewHabit> {
  NewHabitCubit()
      : super(const NewHabit(name: '', description: '', iconCodePoint: 57825));
  setNewHabitName(String name) {
    emit(state.copyWith(name: name));
  }

  setNewHabitDescription(String description) {
    emit(state.copyWith(description: description));
  }

  setNewHabitIconCodePoint(int iconCodePoint) {
    emit(state.copyWith(iconCodePoint: iconCodePoint));
  }

  Future<void> getHabitToEdit(String id) async {
    Box<HabitHive> box = await Hive.openBox('habits');
    try {
      HabitHive? habit = box.get(id);
      if (habit == null) return;
      emit(
        state.copyWith(
          name: habit.name,
          description: habit.description,
          iconCodePoint: habit.icon,
        ),
      );
    } catch (e) {
      // add error handling to crashlytics
    } finally {
      await box.close();
    }
  }

  Future<void> addNewHabit(
    String name,
    String description,
    int iconCodePoint,
  ) async {
    Box<HabitHive> box = await Hive.openBox('habits');
    try {
      final DateTime now = DateTime.now();
      await HabitRepository(box).addHabit(
        now.millisecondsSinceEpoch.toString(),
        HabitHive(
          name: name,
          description: description,
          icon: iconCodePoint,
          frequency: 'daily',
          goal: null,
          streak: 0,
          onlyOn: [],
          doneOn: [],
          createdAt: now,
          updatedAt: now,
        ),
      );
    } catch (e) {
      // add error handling to crashlytics
    } finally {
      await box.close();
    }
  }

  Future<void> updateHabit(
    String id,
    String name,
    String description,
    int iconCodePoint,
  ) async {
    Box<HabitHive> box = await Hive.openBox('habits');
    try {
      final DateTime now = DateTime.now();
      HabitHive prevHabit = box.get(id)!;
      await HabitRepository(box).updateHabit(
        id,
        prevHabit.copyWith(
          name: name,
          description: description,
          icon: iconCodePoint,
          updatedAt: now,
        ),
      );
    } catch (e) {
      // add error handling to crashlytics
    } finally {
      await box.close();
    }
  }

  Future<void> deleteHabit(String id) async {
    Box<HabitHive> box = await Hive.openBox('habits');
    try {
      await HabitRepository(box).deleteHabit(id);
    } catch (e) {
      // add error handling to crashlytics
    } finally {
      await box.close();
    }
  }
}

// Martin Gogołowicz || SobGOG || 14.09.2023
// Last edit: Martin Gogołowicz || SobGOG || 14.09.2023