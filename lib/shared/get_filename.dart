import 'dart:io';

String getFileName(String path) {
  return File(path).path.split('/').last;
}
