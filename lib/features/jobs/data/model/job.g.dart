// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobImplAdapter extends TypeAdapter<_$JobImpl> {
  @override
  final int typeId = 2;

  @override
  _$JobImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$JobImpl(
      id: fields[1] as String,
      description: fields[2] as String,
      aiInsight: fields[3] as String?,
      date: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, _$JobImpl obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.aiInsight)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
