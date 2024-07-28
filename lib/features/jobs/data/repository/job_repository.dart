import 'dart:io';

import 'package:bespoke_ai_job_app/features/jobs/data/model/job.dart';
import 'package:bespoke_ai_job_app/features/resume/data/model/resume_model.dart';
import 'package:bespoke_ai_job_app/shared/app_constants.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hive_flutter/hive_flutter.dart';

class JobRepository {
  final _jobBox = Hive.box<Job>(AppConstants.JOB_BOX_NAME);

  Future<void> saveJob(Job job) async {
    await _jobBox.put(job.id, job);
  }

  Future<List<Job>> fetchJobs() async {
    return _jobBox.values.toList();
  }

  Future<void> deleteJob(Job job) async {
    await _jobBox.delete(job.id);
  }

  Future<String> getAiResponse(
      {required Job job, required ResumeModel resume}) async {
    // get list of images
    List<File> listOfFiles =
        (resume.screenshots ?? []).map((path) => File(path)).toList();
    // get DataPart from images
    List<DataPart> dataparts = listOfFiles
        .map(
          (file) => DataPart(
            "image/png",
            file.readAsBytesSync(),
          ),
        )
        .toList();

    //prepare prompt
    var prompt = TextPart(
        "This is a Job posting ${job.description} provide insight and if possible a cover letter if I am applying with the resume attached in the image");

    final response = await AppConstants.GEMINI.generateContent([
      Content.multi([
        ...dataparts,
        prompt,
      ])
    ]);

    //return response
    return response.text!;
  }
}
