import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'resume_model.g.dart';
part 'resume_model.freezed.dart';

@freezed
class ResumeModel extends HiveObject with _$ResumeModel {
  ResumeModel._();

  @HiveType(typeId: 1)
  factory ResumeModel({
    @HiveField(1) required String id,
    @HiveField(2) required String title,
    @HiveField(3) required String filePath,
    @HiveField(4) required DateTime date,
    @HiveField(5) @Default(null) String? aiInsight,
    @HiveField(6) @Default(null)  List<String>? screenshots,
  }) = _ResumeModel;

  factory ResumeModel.fromJson(Map<String, dynamic> json) =>
      _$ResumeModelFromJson(json);
}
