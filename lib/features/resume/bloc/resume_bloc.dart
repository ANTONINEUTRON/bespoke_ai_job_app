import 'dart:async';
import 'dart:io';

import 'package:bespoke_ai_job_app/features/resume/bloc/resume_state.dart';
import 'package:bespoke_ai_job_app/features/resume/data/model/resume_model.dart';
import 'package:bespoke_ai_job_app/features/resume/data/repository/resume_repository.dart';
import 'package:bespoke_ai_job_app/shared/utility_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_image_renderer/pdf_image_renderer.dart';
import 'package:pdfx/pdfx.dart';
import 'package:uuid/uuid.dart';

class ResumeBloc extends Cubit<ResumeState> {
  ResumeBloc() : super(const ResumeState()) {
    fetchAllResumes();
  }

  final resumeRepo = ResumeRepository();

  Future<void> saveSelectedResume({required File file}) async {
    //save file to filesytem
    String path = await resumeRepo.saveFile(file: file);

    //store reference to hive
    var title = UtilityFunctions.getFileName(path);
    var resumeModel = ResumeModel(
      id: const Uuid().v1(),
      // get title from filename minus the extension
      // detection the extension is based on searching for the -assumed- last dot in the filename
      title: title.substring(0, title.indexOf(".", title.length - 6)),
      filePath: path,
      date: DateTime.now(),
    );

    await resumeRepo.saveToHiveDB(
      resume: resumeModel,
    );

    setSelectedResume(resume: resumeModel);

    fetchAllResumes();

    extractScreenshots(resume: resumeModel);
  }

  Future<void> fetchAllResumes() async {
    var resumes = await resumeRepo.getResumes();
    resumes.sort(
      (a, b) => b.date.compareTo(a.date),
    );
    emit(
      state.copyWith(
        resumes: resumes,
      ),
    );
  }

  Future<void> setSelectedResume({required ResumeModel resume}) async {
    emit(
      state.copyWith(selectedResume: resume),
    );
  }

  void removeResume({required ResumeModel resume}) async {
    await resumeRepo.deleteResume(resume);

    await fetchAllResumes();
  }

  Future<void> extractScreenshots({required ResumeModel resume}) async {
    //get list of images
    List<String> listOfImageUrls =
        await _getListOfImagesPathFromResumeModel(resume: resume);

    //update model
    var updatedResume = resume.copyWith(screenshots: listOfImageUrls);

    await resumeRepo.saveToHiveDB(
      resume: updatedResume,
    );

    setSelectedResume(resume: updatedResume);
  }

  /// This function generates images from the select resume and return a List
  Future<List<String>> _getListOfImagesPathFromResumeModel({
    required ResumeModel resume,
  }) async {
    // Check if the select file is an image
    if (UtilityFunctions.isAnImage(filePath: resume.filePath)) {
      return [resume.filePath];
    }

    //else it is a pdf
    return _getDocScreenshotsPaths(resume: resume);
  }

  Future<List<String>> _getDocScreenshotsPaths({required ResumeModel resume}) async {
    List<String> listOfImages = [];

    final doc = await PdfDocument.openFile(resume.filePath);

    int pageSize = doc.pagesCount;
    
    for (int i = 1; i <= pageSize; i++) {
      var page = await doc.getPage(i);

      final image = await page.render(
        width: page.width * 2, //decrement for less quality
        height: page.height * 2,
        format: PdfPageImageFormat.png,
        backgroundColor: '#ffffff',
      );

      File file = await File("${(await getTemporaryDirectory()).path}/temp.png")
          .create();
      await file.writeAsBytes(image!.bytes);

      await page.close();

      // Save  image to filesystem
      String imgPath = await UtilityFunctions.saveFile(
        fileToSave: file,
        relativePath:
            "/${resume.title}/${i}_${UtilityFunctions.getFileName(resume.filePath).replaceAll(".pdf", ".png")}",
      );

      listOfImages.add(imgPath);
    }

    return listOfImages;
  }
}
