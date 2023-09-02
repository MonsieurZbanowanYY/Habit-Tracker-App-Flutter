import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:habitmate/models/habit_model.dart';
part 'selected_day_model.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class SelectedDay with _$SelectedDay {
  const factory SelectedDay({
    required DateTime selectedDay,
    required List<Habit> habits,
  }) = _SelectedDay;
}
// Martin Gogołowicz || SobGOG || 02.09.2023
// Last edit: Martin Gogołowicz || SobGOG || 02.09.2023