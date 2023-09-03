import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'habit_hive_model.freezed.dart';
part 'habit_hive_model.g.dart';

@freezed
@HiveType(typeId: 0)
class HabitHive with _$HabitHive {
  const factory HabitHive({
    @HiveField(0) required String name,
    @HiveField(1) required int icon,
    @HiveField(2) required String frequency,
    @HiveField(3) required int? goal,
    @HiveField(4) required int streak,
    @HiveField(5) required List<int> onlyOn,
    @HiveField(6) required List<DateTime> doneOn,
    @HiveField(7) required DateTime createdAt,
    @HiveField(8) required DateTime updatedAt,
  }) = _HabitHive;
}
// Martin Gogołowicz || SobGOG || 03.09.2023
// Last edit: Martin Gogołowicz || SobGOG || 03.09.2023