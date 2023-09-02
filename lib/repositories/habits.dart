import 'package:flutter/material.dart';
import 'package:habitmate/models/habit_model.dart';

List<Habit> habits = [
  const Habit(
    name: 'Go for a walk',
    icon: Icons.directions_walk,
    frequency: 'daily',
    goal: null,
    streak: 0,
    onlyOn: [],
    isExpanded: false,
    isDone: false,
  ),
  const Habit(
    name: 'Read a book',
    icon: Icons.book,
    frequency: 'daily',
    goal: null,
    streak: 0,
    onlyOn: [1, 3],
    isExpanded: false,
    isDone: false,
  ),
];
// Martin Gogołowicz || SobGOG || 02.09.2023
// Last edit: Martin Gogołowicz || SobGOG || 02.09.2023