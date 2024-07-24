import 'package:bespoke_ai_job_app/features/resume/data/model/resume_model.dart';
import 'package:equatable/equatable.dart';

class ResumeState extends Equatable {
  const ResumeState({
    this.resumes = const [],
    this.selectedResume,
    this.aiInsight,
    this.errorMessage,
  });

  final List<ResumeModel> resumes;
  final ResumeModel? selectedResume;
  final String? aiInsight;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        resumes,
        selectedResume,
        aiInsight,
        errorMessage,
      ];

  ResumeState copyWith({
    List<ResumeModel>? resumes,
    ResumeModel? selectedResume,
    String? aiInsight,
    String? errorMessage,
  }) {
    return ResumeState(
      resumes: resumes ?? this.resumes,
      selectedResume: selectedResume ?? this.selectedResume,
      aiInsight: aiInsight ?? this.aiInsight,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
