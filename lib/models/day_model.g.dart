// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayAdapter extends TypeAdapter<Day> {
  @override
  Day read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Day(
      id: fields[0] as String,
      date: fields[1] as DateTime,
      socialDistance: fields[2] as bool,
      feelings: (fields[3] as List)?.cast<String>(),
      activities: (fields[4] as List)?.cast<String>(),
      note: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Day obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.socialDistance)
      ..writeByte(3)
      ..write(obj.feelings?.toList())
      ..writeByte(4)
      ..write(obj.activities?.toList())
      ..writeByte(5)
      ..write(obj.note);
  }
}
