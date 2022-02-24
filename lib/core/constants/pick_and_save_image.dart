import 'dart:io';

import 'package:chateo/core/constants/logger_devtool.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DeviceResources {
  const DeviceResources._();

  static Future<File> saveFileToDocumentsDirectory(PlatformFile file) async {
    final _localPath = await getApplicationDocumentsDirectory();
    final newFile = File('${_localPath.path}/${file.name}');
    newFile.logWtf();
    final finalFile = await File(file.path!).copy(newFile.path);
    return finalFile;
  }

  static void openFileDevice(String path) {
    OpenFile.open(path);
  }

  static Future<FilePickerResult?> pickFileImage() =>
      FilePicker.platform.pickFiles(type: FileType.image);

  static Future<File> saveImage(FilePickerResult filePicked) {
    final file = filePicked.files.first;
    return saveFileToDocumentsDirectory(file);
  }

  static String getFileName(File fileName) => basename(fileName.path);
  static Future<String> downloadURLExist(String pathNameImage) async {
    try {
      return await FirebaseStorage.instance.ref(pathNameImage).getDownloadURL();
    } catch (_) {
      rethrow;
    }

    // Within your widgets:
    // Image.network(downloadURL);
  }
}
