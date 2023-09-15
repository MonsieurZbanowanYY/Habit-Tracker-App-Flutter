import 'package:freezed_annotation/freezed_annotation.dart';
part 'habit_model.freezed.dart';

@freezed
class Habit with _$Habit {
  const factory Habit({
    required String id,
    required String description,
    required String name,
    required int icon,
    required String frequency,
    required int? goal,
    required int streak,
    required List<int> onlyOn,
    required List<DateTime> doneOn,
    required bool isExpanded,
    required bool isDone,
  }) = _Habit;
}
// Martin Gogołowicz || SobGOG || 02.09.2023
// Last edit: Martin Gogołowicz || SobGOG || 14.09.2023