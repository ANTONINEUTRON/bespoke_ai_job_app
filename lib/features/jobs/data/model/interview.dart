import 'package:freezed_annotation/freezed_annotation.dart';

part 'interview.freezed.dart';
part 'interview.g.dart';

@freezed
class Interview with _$Interview{
  factory Interview({
    required String question,
    required String response,
  }) = _Interview;

  factory Interview.fromJson(Map<String, Object?> json) => _$InterviewFromJson(json);
}