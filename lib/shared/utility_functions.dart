import 'package:bespoke_ai_job_app/features/resume/bloc/resume_bloc.dart';
import 'package:bespoke_ai_job_app/features/resume/ui/pages/resume_analysis_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mime/mime.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class UtilityFunctions {
  static void selectFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ["jpg", "png", "webp", "pdf"],
      type: FileType.custom,
    );

    if (context.mounted) {
      if (result != null) {
        File file = File(result.files.single.path!);

        //Save File
        context.read<ResumeBloc>().saveSelectedResume(file: file).then(
          (value) {
            Navigator.push(
              context,
              ResumeAnalysisPage.route(),
            );
          },
        );
      } else {
        // User canceled the picker
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("No file selected"),
        ));
      }
    }
  }

  static String getFileName(String path) {
    return File(path).path.split('/').last;
  }

  static bool isAnImage({required String filePath}) {
    return (lookupMimeType(filePath) ?? "").toLowerCase().contains("image")
        ? true
        : false;
  }

  /// This function saves a file using File.copy and return the path
  /// relativePath should start with '/'
  static Future<String> saveFile({
    required File fileToSave,
    required String relativePath,
  }) async {
    // get directory to store resumes
    var directory = await getApplicationSupportDirectory();

    var file = File(directory.path + relativePath);

    if (!await file.exists()) await file.create(recursive: true);

    // save file to path
    await fileToSave.copy(file.path);

    // after save return path
    return file.path;
  }
}

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mime/mime.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// import '../features/resume/bloc/resume_bloc.dart';
// import '../features/resume/ui/pages/resume_analysis_page.dart';
//
// class UtilityFunctions {
//   static void selectFile(BuildContext context) async {
//     // Request storage permission
//     var status = await Permission.storage.status;
//     if (status.isDenied || status.isPermanentlyDenied) {
//       status = await Permission.storage.request();
//       if (status.isDenied || status.isPermanentlyDenied) {
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text("Storage permission is required to select a file"),
//         ));
//         return;
//       }
//     }
//
//     // Proceed with file picking
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       allowedExtensions: ["jpg", "png", "webp", "pdf"],
//       type: FileType.custom,
//     );
//
//     if (context.mounted) {
//       if (result != null && result.files.single.path != null) {
//         File file = File(result.files.single.path!);
//
//         // Save File
//         context.read<ResumeBloc>().saveSelectedResume(file: file).then(
//               (value) {
//             Navigator.push(
//               context,
//               ResumeAnalysisPage.route(),
//             );
//           },
//         );
//       } else {
//         // User canceled the picker or file path is invalid
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text("No file selected or file path is invalid"),
//         ));
//       }
//     }
//   }
//
//   static String getFileName(String path) {
//     return File(path).path.split('/').last;
//   }
//
//   static bool isAnImage({required String filePath}) {
//     return (lookupMimeType(filePath) ?? "").toLowerCase().contains("image")
//         ? true
//         : false;
//   }
//
//   /// This function saves a file using File.copy and returns the saved path
//   /// relativePath should start with '/'
//   static Future<String> saveFile({
//     required File fileToSave,
//     required String relativePath,
//   }) async {
//     // Get directory to store files
//     var directory = await getApplicationSupportDirectory();
//
//     var file = File(directory.path + relativePath);
//
//     // Create the file path if it doesn’t exist
//     if (!await file.exists()) await file.create(recursive: true);
//
//     // Save file to path
//     await fileToSave.copy(file.path);
//
//     // Return path after saving
//     return file.path;
//   }
// }




