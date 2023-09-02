// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Habit {
  String get name => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  String get frequency => throw _privateConstructorUsedError;
  int? get goal => throw _privateConstructorUsedError;
  int get streak => throw _privateConstructorUsedError;
  List<dynamic> get onlyOn => throw _privateConstructorUsedError;
  bool get isExpanded => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HabitCopyWith<Habit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitCopyWith<$Res> {
  factory $HabitCopyWith(Habit value, $Res Function(Habit) then) =
      _$HabitCopyWithImpl<$Res, Habit>;
  @useResult
  $Res call(
      {String name,
      IconData icon,
      String frequency,
      int? goal,
      int streak,
      List<dynamic> onlyOn,
      bool isExpanded,
      bool isDone});
}

/// @nodoc
class _$HabitCopyWithImpl<$Res, $Val extends Habit>
    implements $HabitCopyWith<$Res> {
  _$HabitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
    Object? frequency = null,
    Object? goal = freezed,
    Object? streak = null,
    Object? onlyOn = null,
    Object? isExpanded = null,
    Object? isDone = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as int?,
      streak: null == streak
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
      onlyOn: null == onlyOn
          ? _value.onlyOn
          : onlyOn // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HabitCopyWith<$Res> implements $HabitCopyWith<$Res> {
  factory _$$_HabitCopyWith(_$_Habit value, $Res Function(_$_Habit) then) =
      __$$_HabitCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      IconData icon,
      String frequency,
      int? goal,
      int streak,
      List<dynamic> onlyOn,
      bool isExpanded,
      bool isDone});
}

/// @nodoc
class __$$_HabitCopyWithImpl<$Res> extends _$HabitCopyWithImpl<$Res, _$_Habit>
    implements _$$_HabitCopyWith<$Res> {
  __$$_HabitCopyWithImpl(_$_Habit _value, $Res Function(_$_Habit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
    Object? frequency = null,
    Object? goal = freezed,
    Object? streak = null,
    Object? onlyOn = null,
    Object? isExpanded = null,
    Object? isDone = null,
  }) {
    return _then(_$_Habit(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as int?,
      streak: null == streak
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
      onlyOn: null == onlyOn
          ? _value._onlyOn
          : onlyOn // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Habit implements _Habit {
  const _$_Habit(
      {required this.name,
      required this.icon,
      required this.frequency,
      required this.goal,
      required this.streak,
      required final List<dynamic> onlyOn,
      required this.isExpanded,
      required this.isDone})
      : _onlyOn = onlyOn;

  @override
  final String name;
  @override
  final IconData icon;
  @override
  final String frequency;
  @override
  final int? goal;
  @override
  final int streak;
  final List<dynamic> _onlyOn;
  @override
  List<dynamic> get onlyOn {
    if (_onlyOn is EqualUnmodifiableListView) return _onlyOn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_onlyOn);
  }

  @override
  final bool isExpanded;
  @override
  final bool isDone;

  @override
  String toString() {
    return 'Habit(name: $name, icon: $icon, frequency: $frequency, goal: $goal, streak: $streak, onlyOn: $onlyOn, isExpanded: $isExpanded, isDone: $isDone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Habit &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.goal, goal) || other.goal == goal) &&
            (identical(other.streak, streak) || other.streak == streak) &&
            const DeepCollectionEquality().equals(other._onlyOn, _onlyOn) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded) &&
            (identical(other.isDone, isDone) || other.isDone == isDone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, icon, frequency, goal,
      streak, const DeepCollectionEquality().hash(_onlyOn), isExpanded, isDone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HabitCopyWith<_$_Habit> get copyWith =>
      __$$_HabitCopyWithImpl<_$_Habit>(this, _$identity);
}

abstract class _Habit implements Habit {
  const factory _Habit(
      {required final String name,
      required final IconData icon,
      required final String frequency,
      required final int? goal,
      required final int streak,
      required final List<dynamic> onlyOn,
      required final bool isExpanded,
      required final bool isDone}) = _$_Habit;

  @override
  String get name;
  @override
  IconData get icon;
  @override
  String get frequency;
  @override
  int? get goal;
  @override
  int get streak;
  @override
  List<dynamic> get onlyOn;
  @override
  bool get isExpanded;
  @override
  bool get isDone;
  @override
  @JsonKey(ignore: true)
  _$$_HabitCopyWith<_$_Habit> get copyWith =>
      throw _privateConstructorUsedError;
}
