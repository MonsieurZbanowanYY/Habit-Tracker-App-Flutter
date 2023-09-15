import 'package:habitmate/models/habit_model.dart';
import 'package:hive/hive.dart';
import 'package:habitmate/models/habit_hive_model.dart';

class HabitRepository {
  final Box<HabitHive>? habitBox;

  HabitRepository(this.habitBox);

  Future<List<HabitHive>> getAllHabits() async {
    if (habitBox == null) return [];
    return habitBox!.values.toList().cast<HabitHive>();
  }

  Future<void> addHabit(String id, HabitHive habit) async {
    if (habitBox == null) return;
    await habitBox!.put(id, habit);
  }

  Future<void> updateHabit(String id, HabitHive habit) async {
    if (habitBox == null) return;
    await habitBox!.put(id, habit);
  }

  Future<void> deleteHabit(String habitId) async {
    if (habitBox == null) return;
    await habitBox!.delete(habitId);
  }

  List<Habit> getHabitsForDate(DateTime date) {
    if (habitBox == null) return [];
    final habitsHive = habitBox!.values.toList().cast<HabitHive>();
    List<Habit> habits = [];
    for (int i = 0; i < habitsHive.length; i++) {
      if (habitsHive[i].onlyOn.contains(date.weekday) ||
          habitsHive[i].onlyOn.isEmpty) {
        bool isDone = false;
        for (int j = 0; j < habitsHive[i].doneOn.length; j++) {
          if (habitsHive[i].doneOn[j].day == date.day &&
              habitsHive[i].doneOn[j].month == date.month &&
              habitsHive[i].doneOn[j].year == date.year) {
            isDone = true;
          }
        }
        habits.add(
          HabitRepository(habitBox)
              .convertHabitHiveToHabit(habitsHive[i])
              .copyWith(
                isDone: isDone,
              ),
        );
      }
    }
    return habits;
  }

  Habit convertHabitHiveToHabit(HabitHive habitHive) {
    return Habit(
      id: habitHive.createdAt.millisecondsSinceEpoch.toString(),
      name: habitHive.name,
      description: habitHive.description,
      icon: habitHive.icon,
      frequency: habitHive.frequency,
      goal: habitHive.goal,
      streak: habitHive.streak,
      onlyOn: habitHive.onlyOn,
      doneOn: habitHive.doneOn,
      isExpanded: false,
      isDone: false,
    );
  }

  HabitHive convertHabitToHabitHive(Habit habit, DateTime now) {
    return HabitHive(
      name: habit.name,
      description: habit.description,
      icon: habit.icon,
      frequency: habit.frequency,
      goal: habit.goal,
      streak: habit.streak,
      onlyOn: habit.onlyOn,
      doneOn: habit.doneOn,
      createdAt: now,
      updatedAt: now,
    );
  }
}
// Martin Gogołowicz || SobGOG || 03.09.2023
// Last edit: Martin Gogołowicz || SobGOG || 14.09.2023