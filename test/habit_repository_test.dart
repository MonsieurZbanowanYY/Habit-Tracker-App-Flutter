import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habitmate/models/habit_hive_model.dart';
import 'package:habitmate/models/habit_model.dart';
import 'package:habitmate/repositories/habit_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.init('test/hive');
  Hive.registerAdapter(HabitHiveAdapter());
  test('getHabitsForDate returns a list of Habits for a given date', () async {
    Box<HabitHive> box = await Hive.openBox<HabitHive>('habits');
    HabitRepository repository = HabitRepository(box);

    DateTime today = DateTime.now();
    HabitHive habitHive1 = HabitHive(
      name: 'Habit 1',
      description: 'Habit description',
      icon: Icons.accessibility.codePoint,
      frequency: 'daily',
      goal: null,
      streak: 0,
      onlyOn: [],
      doneOn: [
        DateTime.utc(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
        )
      ],
      createdAt: today,
      updatedAt: today,
    );

    HabitHive habitHive2 = HabitHive(
      name: 'Habit 2',
      description: 'Habit description',
      icon: Icons.auto_fix_normal.codePoint,
      frequency: 'daily',
      goal: null,
      streak: 0,
      onlyOn: [],
      doneOn: [
        DateTime.utc(
          today.year,
          3,
          5,
        )
      ],
      createdAt: today,
      updatedAt: today,
    );

    await repository.addHabit('1', habitHive1);
    await repository.addHabit('2', habitHive2);

    List<Habit> habits = repository.getHabitsForDate(today);

    expect(habits.length, 2);
    expect(habits[0].name, 'Habit 1');
    expect(habits[0].icon, Icons.accessibility.codePoint);
    expect(habits[0].doneOn.length, 1);
    expect(habits[0].doneOn[0].day, today.day);
    expect(habits[0].isDone, true);
    expect(habits[1].name, 'Habit 2');
    expect(habits[0].icon, Icons.accessibility.codePoint);
    expect(habits[1].doneOn.length, 1);
    expect(habits[1].doneOn[0].day, 5);
    expect(habits[1].isDone, false);

    await box.close();
  });

  test('convertHabitHiveToHabit converts HabitHive to Habit', () {
    HabitHive habitHive = HabitHive(
      name: 'Habit',
      description: 'Habit description',
      icon: Icons.accessibility.codePoint,
      frequency: 'daily',
      goal: null,
      streak: 0,
      onlyOn: [1, 2, 3],
      doneOn: [],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    HabitRepository repository = HabitRepository(null);
    Habit habit = repository.convertHabitHiveToHabit(habitHive);

    expect(habit.id, habitHive.createdAt.millisecondsSinceEpoch.toString());
    expect(habit.name, 'Habit');
    expect(habit.icon, Icons.accessibility.codePoint);
    expect(habit.isDone, false);
  });

  test('convertHabitToHabitHive converts Habit to HabitHive', () {
    DateTime now = DateTime.now();
    Habit habit = Habit(
      id: now.millisecondsSinceEpoch.toString(),
      name: 'Habit',
      description: 'Habit description',
      icon: Icons.accessibility.codePoint,
      frequency: 'daily',
      goal: null,
      streak: 0,
      onlyOn: [1, 2, 3],
      doneOn: [],
      isExpanded: false,
      isDone: false,
    );

    HabitRepository repository = HabitRepository(null);
    HabitHive habitHive = repository.convertHabitToHabitHive(habit, now);

    expect(habitHive.name, 'Habit');
    expect(habitHive.icon, Icons.accessibility.codePoint);
    expect(habitHive.createdAt, now);
  });
}
// Martin Gogołowicz || SobGOG || 03.09.2023
// Last edit: Martin Gogołowicz || SobGOG || 14.09.2023