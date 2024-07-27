import 'package:bespoke_ai_job_app/features/jobs/data/model/job.dart';
import 'package:equatable/equatable.dart';

class JobsState extends Equatable {
  const JobsState({
    this.job,
    this.jobs = const [],
    this.aiInsight,
  });

  final Job? job;
  final List<Job> jobs;
  final String? aiInsight;

  @override
  List<Object?> get props => [
        job,
        jobs,
        aiInsight,
      ];

  JobsState copyWith({
    Job? job,
    List<Job>? jobs,
    String? aiInsight,
  }) {
    return JobsState(
      job: job ?? this.job,
      jobs: jobs ?? this.jobs,
      aiInsight: aiInsight ?? this.aiInsight,
    );
  }
}
