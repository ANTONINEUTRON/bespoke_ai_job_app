import 'dart:io';
import 'package:bespoke_ai_job_app/shared/app_constants.dart';
import 'package:bespoke_ai_job_app/features/resume/data/model/resume_model.dart';
import 'package:bespoke_ai_job_app/shared/utility_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ResumeRepository {
  var resumeBox = Hive.box<ResumeModel>(AppConstants.RESUME_BOX_NAME);

  Future<String> saveFile({required File file}) async {
    return UtilityFunctions.saveFile(
      fileToSave: file,
      relativePath: "/resumes/${UtilityFunctions.getFileName(file.path)}",
    );
  }

  Future<void> saveToHiveDB({required ResumeModel resume}) async {
    resumeBox.put(
      resume.id,
      resume,
    );
  }

  Future<List<ResumeModel>> getResumes() async {
    return resumeBox.values.toList();
  }

  Future<void> deleteResume(ResumeModel resume) async {
    // delete file
    try {
      await File(resume.filePath).delete();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    // remove file from hive
    await resumeBox.delete(resume.id);
  }

  Future<String> generateAiInsight({required ResumeModel resume}) async {
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
    var prompt = TextPart("Attached are image of a resume, review it");
    
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
