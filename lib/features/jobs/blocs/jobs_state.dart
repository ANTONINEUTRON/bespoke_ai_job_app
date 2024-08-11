import 'package:bespoke_ai_job_app/features/jobs/data/model/interview.dart';
import 'package:bespoke_ai_job_app/features/jobs/data/model/job.dart';
import 'package:equatable/equatable.dart';

enum InterviewQuestionsStatus {
  processing,
  error,
  success,
}

class JobsState extends Equatable {
  const JobsState({
    this.job,
    this.jobs = const [],
    this.aiInsight,
    this.errorMsg,
    this.interviewQuestions,
    this.interviewQuestionsStatus = InterviewQuestionsStatus.processing,
  });

  final Job? job;
  final List<Job> jobs;
  final String? aiInsight;
  final String? errorMsg;
  final List<Interview>? interviewQuestions;
  final InterviewQuestionsStatus interviewQuestionsStatus;

  @override
  List<Object?> get props => [
        job,
        jobs,
        aiInsight,
        errorMsg,
        interviewQuestions,
        interviewQuestionsStatus,
      ];

  JobsState copyWith({
    Job? job,
    List<Job>? jobs,
    String? aiInsight,
    String? errorMsg,
    List<Interview>? interviewQuestions,
    InterviewQuestionsStatus? interviewQuestionsStatus,
  }) {
    return JobsState(
      job: job ?? this.job,
      jobs: jobs ?? this.jobs,
      aiInsight: aiInsight ?? this.aiInsight,
      errorMsg: errorMsg ?? this.errorMsg,
      interviewQuestions: interviewQuestions ?? interviewQuestions,
      interviewQuestionsStatus:
          interviewQuestionsStatus ?? this.interviewQuestionsStatus,
    );
  }
}
