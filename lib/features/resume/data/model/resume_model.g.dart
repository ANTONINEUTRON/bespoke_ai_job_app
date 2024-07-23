// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResumeModelImplAdapter extends TypeAdapter<_$ResumeModelImpl> {
  @override
  final int typeId = 1;

  @override
  _$ResumeModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ResumeModelImpl(
      id: fields[1] as String,
      title: fields[2] as String,
      filePath: fields[3] as String,
      date: fields[4] as DateTime,
      aiInsight: fields[5] as String?,
      screenshots: (fields[6] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$ResumeModelImpl obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.filePath)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.aiInsight)
      ..writeByte(6)
      ..write(obj.screenshots);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResumeModelImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResumeModelImpl _$$ResumeModelImplFromJson(Map<String, dynamic> json) =>
    _$ResumeModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      filePath: json['filePath'] as String,
      date: DateTime.parse(json['date'] as String),
      aiInsight: json['aiInsight'] as String? ?? null,
      screenshots: (json['screenshots'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          null,
    );

Map<String, dynamic> _$$ResumeModelImplToJson(_$ResumeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'filePath': instance.filePath,
      'date': instance.date.toIso8601String(),
      'aiInsight': instance.aiInsight,
      'screenshots': instance.screenshots,
    };
