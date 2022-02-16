import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'api_constant.dart';

String countryFlagGenerate({String countryCode = 'eg'}) {
  return countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
}

Future<File> saveFileToDocumentsDirectory(PlatformFile file) async {
  final _localPath = await getApplicationDocumentsDirectory();
  final newFile = File('${_localPath.path}/${file.name}');
  logger.wtf("message");
  return File(file.path!).copy(newFile.path);
}

void openFileDevice(String path) {
  OpenFile.open(path);
}

Future<FilePickerResult?> pickFileImage() async =>
    await FilePicker.platform.pickFiles(type: FileType.image);

Future<File> saveImage(FilePickerResult filePicked) async {
  final file = filePicked.files.first;
  return await saveFileToDocumentsDirectory(file);
}
