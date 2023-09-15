// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_habit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewHabit {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get iconCodePoint => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewHabitCopyWith<NewHabit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewHabitCopyWith<$Res> {
  factory $NewHabitCopyWith(NewHabit value, $Res Function(NewHabit) then) =
      _$NewHabitCopyWithImpl<$Res, NewHabit>;
  @useResult
  $Res call({String name, String description, int iconCodePoint});
}

/// @nodoc
class _$NewHabitCopyWithImpl<$Res, $Val extends NewHabit>
    implements $NewHabitCopyWith<$Res> {
  _$NewHabitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? iconCodePoint = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      iconCodePoint: null == iconCodePoint
          ? _value.iconCodePoint
          : iconCodePoint // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewHabitCopyWith<$Res> implements $NewHabitCopyWith<$Res> {
  factory _$$_NewHabitCopyWith(
          _$_NewHabit value, $Res Function(_$_NewHabit) then) =
      __$$_NewHabitCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String description, int iconCodePoint});
}

/// @nodoc
class __$$_NewHabitCopyWithImpl<$Res>
    extends _$NewHabitCopyWithImpl<$Res, _$_NewHabit>
    implements _$$_NewHabitCopyWith<$Res> {
  __$$_NewHabitCopyWithImpl(
      _$_NewHabit _value, $Res Function(_$_NewHabit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? iconCodePoint = null,
  }) {
    return _then(_$_NewHabit(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      iconCodePoint: null == iconCodePoint
          ? _value.iconCodePoint
          : iconCodePoint // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_NewHabit with DiagnosticableTreeMixin implements _NewHabit {
  const _$_NewHabit(
      {required this.name,
      required this.description,
      required this.iconCodePoint});

  @override
  final String name;
  @override
  final String description;
  @override
  final int iconCodePoint;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NewHabit(name: $name, description: $description, iconCodePoint: $iconCodePoint)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NewHabit'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('iconCodePoint', iconCodePoint));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewHabit &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.iconCodePoint, iconCodePoint) ||
                other.iconCodePoint == iconCodePoint));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, description, iconCodePoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewHabitCopyWith<_$_NewHabit> get copyWith =>
      __$$_NewHabitCopyWithImpl<_$_NewHabit>(this, _$identity);
}

abstract class _NewHabit implements NewHabit {
  const factory _NewHabit(
      {required final String name,
      required final String description,
      required final int iconCodePoint}) = _$_NewHabit;

  @override
  String get name;
  @override
  String get description;
  @override
  int get iconCodePoint;
  @override
  @JsonKey(ignore: true)
  _$$_NewHabitCopyWith<_$_NewHabit> get copyWith =>
      throw _privateConstructorUsedError;
}
