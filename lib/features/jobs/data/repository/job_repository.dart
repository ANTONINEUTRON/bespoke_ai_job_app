import 'dart:convert';
import 'dart:io';

import 'package:bespoke_ai_job_app/features/jobs/data/model/interview.dart';
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
        "This is a Job posting ${job.description}.\n provide insight on applying and also write a sample cover letter based on the resume attached in the image");

    final response = await AppConstants.GEMINI.generateContent([
      Content.multi([
        ...dataparts,
        prompt,
      ])
    ]);

    //return response
    return response.text!;
  }

  Future<List<Interview>> getInterviewQuestion({
    required String jobDescription,
  }) async {
    //prepare prompt
    var prompt = "This is a Job posting ${jobDescription}.\n " +
        "provide atleast 5 and not more than 20 interview questions and their answers as json using this schema\n\n" +
        "Interview = {'question': string, 'response': string,}\n Return: Array<Interview>";

    final response =
        await AppConstants.GEMINI.generateContent([Content.text(prompt)]);

    //return response
    var jsonAsString = _removeAllCharactersExceptJson(text: response.text!);
    var jsonObj = jsonDecode(jsonAsString) as List<dynamic>;

    return jsonObj.map(
      (element) {
        return Interview.fromJson(element);
      },
    ).toList();
  }

  String _removeAllCharactersExceptJson({required String text}) {
    return text.substring(text.indexOf("["), text.lastIndexOf("]") + 1);
  }
}
