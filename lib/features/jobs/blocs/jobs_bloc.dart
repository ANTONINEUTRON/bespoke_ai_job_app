import 'package:bespoke_ai_job_app/features/jobs/blocs/jobs_state.dart';
import 'package:bespoke_ai_job_app/features/jobs/data/model/job.dart';
import 'package:bespoke_ai_job_app/features/jobs/data/repository/job_repository.dart';
import 'package:bespoke_ai_job_app/features/resume/data/model/resume_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobsBloc extends Cubit<JobsState> {
  JobsBloc() : super(const JobsState()) {
    fetchAllJobs();
  }

  final JobRepository _jobRepository = JobRepository();

  void setJob(Job job) async {
    // save to db
    await _jobRepository.saveJob(job);

    emit(state.copyWith(job: job));

    fetchAllJobs();
  }

  void fetchAllJobs() async {
    List<Job> jobs = await _jobRepository.fetchJobs();
    emit(state.copyWith(jobs: jobs));
  }

  void deleteJob(Job job) async {
    await _jobRepository.deleteJob(job);
    fetchAllJobs();
  }

  /// This function generate ai insight on the user resume in relation to the Job posted
  /// the job has been set and saved in this state already
  void generateAiInsight({required ResumeModel resume}) async {
    try {
      String aiInsight = await _jobRepository.getAiResponse(
        job: state.job!,
        resume: resume,
      );

      emit(
        state.copyWith(aiInsight: aiInsight),
      );
    } catch (e) {
      emit(
        state.copyWith(
            errorMsg: "An error occured while generating job insight"),
      );
    }
  }

  void reset() => emit(JobsState(jobs: state.jobs));
}
