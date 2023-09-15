import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'habit_hive_model.freezed.dart';
part 'habit_hive_model.g.dart';

@freezed
@HiveType(typeId: 0)
class HabitHive with _$HabitHive {
  const factory HabitHive({
    @HiveField(0) required String name,
    @HiveField(1) required String description,
    @HiveField(2) required int icon,
    @HiveField(3) required String frequency,
    @HiveField(4) required int? goal,
    @HiveField(5) required int streak,
    @HiveField(6) required List<int> onlyOn,
    @HiveField(7) required List<DateTime> doneOn,
    @HiveField(8) required DateTime createdAt,
    @HiveField(9) required DateTime updatedAt,
  }) = _HabitHive;
}
// Martin Gogołowicz || SobGOG || 03.09.2023
// Last edit: Martin Gogołowicz || SobGOG || 14.09.2023