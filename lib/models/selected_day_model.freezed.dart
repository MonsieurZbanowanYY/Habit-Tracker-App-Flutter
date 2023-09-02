// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_day_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectedDay {
  DateTime get selectedDay => throw _privateConstructorUsedError;
  List<Habit> get habits => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectedDayCopyWith<SelectedDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedDayCopyWith<$Res> {
  factory $SelectedDayCopyWith(
          SelectedDay value, $Res Function(SelectedDay) then) =
      _$SelectedDayCopyWithImpl<$Res, SelectedDay>;
  @useResult
  $Res call({DateTime selectedDay, List<Habit> habits});
}

/// @nodoc
class _$SelectedDayCopyWithImpl<$Res, $Val extends SelectedDay>
    implements $SelectedDayCopyWith<$Res> {
  _$SelectedDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDay = null,
    Object? habits = null,
  }) {
    return _then(_value.copyWith(
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      habits: null == habits
          ? _value.habits
          : habits // ignore: cast_nullable_to_non_nullable
              as List<Habit>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SelectedDayCopyWith<$Res>
    implements $SelectedDayCopyWith<$Res> {
  factory _$$_SelectedDayCopyWith(
          _$_SelectedDay value, $Res Function(_$_SelectedDay) then) =
      __$$_SelectedDayCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime selectedDay, List<Habit> habits});
}

/// @nodoc
class __$$_SelectedDayCopyWithImpl<$Res>
    extends _$SelectedDayCopyWithImpl<$Res, _$_SelectedDay>
    implements _$$_SelectedDayCopyWith<$Res> {
  __$$_SelectedDayCopyWithImpl(
      _$_SelectedDay _value, $Res Function(_$_SelectedDay) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDay = null,
    Object? habits = null,
  }) {
    return _then(_$_SelectedDay(
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      habits: null == habits
          ? _value.habits
          : habits // ignore: cast_nullable_to_non_nullable
              as List<Habit>,
    ));
  }
}

/// @nodoc

class _$_SelectedDay with DiagnosticableTreeMixin implements _SelectedDay {
  const _$_SelectedDay({required this.selectedDay, required this.habits});

  @override
  final DateTime selectedDay;
  @override
  final List<Habit> habits;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SelectedDay(selectedDay: $selectedDay, habits: $habits)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SelectedDay'))
      ..add(DiagnosticsProperty('selectedDay', selectedDay))
      ..add(DiagnosticsProperty('habits', habits));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectedDay &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            const DeepCollectionEquality().equals(other.habits, habits));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, selectedDay, const DeepCollectionEquality().hash(habits));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectedDayCopyWith<_$_SelectedDay> get copyWith =>
      __$$_SelectedDayCopyWithImpl<_$_SelectedDay>(this, _$identity);
}

abstract class _SelectedDay implements SelectedDay {
  const factory _SelectedDay(
      {required final DateTime selectedDay,
      required final List<Habit> habits}) = _$_SelectedDay;

  @override
  DateTime get selectedDay;
  @override
  List<Habit> get habits;
  @override
  @JsonKey(ignore: true)
  _$$_SelectedDayCopyWith<_$_SelectedDay> get copyWith =>
      throw _privateConstructorUsedError;
}
