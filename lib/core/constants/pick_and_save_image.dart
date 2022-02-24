// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:path/path.dart';

// import 'api_constant.dart';

// class PickAndSaveImage {
//   const PickAndSaveImage._();
//   static Future<File> saveFileToDocumentsDirectory(PlatformFile file) async {
//     final prefs = await SharedPreferences.getInstance();
//     final _localPath = await getApplicationDocumentsDirectory();
//     final newFile = File('${_localPath.path}/${file.name}');
//     logger.wtf(newFile);
//     final finalFile = await File(file.path!).copy(newFile.path);
//     await prefs.setString(photoPath, finalFile.path);
//     return finalFile;
//   }

//   static void openFileDevice(String path) {
//     OpenFile.open(path);
//   }

//   static Future<FilePickerResult?> pickFileImage() async =>
//       await FilePicker.platform.pickFiles(type: FileType.image);

//   static Future<File> saveImage(FilePickerResult filePicked) async {
//     final file = filePicked.files.first;
//     return await saveFileToDocumentsDirectory(file);
//   }

//   static String getFileName(File fileName) => basename(fileName.path);
//   static Future<String> downloadURLExist(String pathNameImage) async {
//     try {
//       return await FirebaseStorage.instance.ref(pathNameImage).getDownloadURL();
//     } catch (_) {
//       rethrow ;
//     }

//     // Within your widgets:
//     // Image.network(downloadURL);
//   }
// }
