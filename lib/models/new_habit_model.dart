import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'new_habit_model.freezed.dart';

@freezed
class NewHabit with _$NewHabit {
  const factory NewHabit({
    required String name,
    required String description,
    required int iconCodePoint,
  }) = _NewHabit;
}
// Martin Gogołowicz || SobGOG || 14.09.2023
// Last edit: Martin Gogołowicz || SobGOG || 14.09.2023