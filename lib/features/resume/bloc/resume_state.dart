import 'package:bespoke_ai_job_app/features/resume/data/model/resume_model.dart';
import 'package:equatable/equatable.dart';

class ResumeState extends Equatable {
  const ResumeState({
    this.resumes = const [],
    this.selectedResume,
  });

  final List<ResumeModel> resumes;
  final ResumeModel? selectedResume;

  @override
  List<Object?> get props => [
        resumes,
        selectedResume,
      ];

  ResumeState copyWith({
    List<ResumeModel>? resumes,
    ResumeModel? selectedResume,
  }) {
    return ResumeState(
      resumes: resumes ?? this.resumes,
      selectedResume: selectedResume ?? this.selectedResume,
    );
  }
}
