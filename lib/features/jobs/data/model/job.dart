import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'job.freezed.dart';
part 'job.g.dart';

@freezed
class Job extends HiveObject with _$Job {
  Job._();

  @HiveType(typeId: 2)
  factory Job({
    @HiveField(1) required String id,
    @HiveField(2) required String description,
    @HiveField(3) String? aiInsight,
    @HiveField(4) DateTime? date,
  }) = _Job;
}
