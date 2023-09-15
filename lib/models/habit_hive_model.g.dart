// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitHiveAdapter extends TypeAdapter<HabitHive> {
  @override
  final int typeId = 0;

  @override
  HabitHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HabitHive(
      name: fields[0] as String,
      description: fields[1] as String,
      icon: fields[2] as int,
      frequency: fields[3] as String,
      goal: fields[4] as int?,
      streak: fields[5] as int,
      onlyOn: (fields[6] as List).cast<int>(),
      doneOn: (fields[7] as List).cast<DateTime>(),
      createdAt: fields[8] as DateTime,
      updatedAt: fields[9] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HabitHive obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.frequency)
      ..writeByte(4)
      ..write(obj.goal)
      ..writeByte(5)
      ..write(obj.streak)
      ..writeByte(6)
      ..write(obj.onlyOn)
      ..writeByte(7)
      ..write(obj.doneOn)
      ..writeByte(8)
      ..write(obj.createdAt)
      ..writeByte(9)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
