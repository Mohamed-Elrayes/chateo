import 'package:chateo/presentation/widget/shared_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String countryFlagGenerate({String countryCode = 'eg'}) {
  return countryCode.toUpperCase().replaceAllMapped(
        RegExp('[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
      );
}

SnackBar snackBarWidget(String message) {
  return SnackBar(
    backgroundColor: Colors.red,
    duration: const Duration(seconds: 3),
    content: CustomTextWidget(message),
  );
}
  String getFormattedTimeEvent(int time) {
    final DateFormat newFormat = DateFormat("h:mm a");
    return newFormat.format(DateTime.fromMillisecondsSinceEpoch(time));
  }


// Future<File> saveFileToDocumentsDirectory(PlatformFile file) async {
//   final prefs = await SharedPreferences.getInstance();
//   final _localPath = await getApplicationDocumentsDirectory();
//   final newFile = File('${_localPath.path}/${file.name}');
//   logger.wtf(newFile);
//   final finalFile = await File(file.path!).copy(newFile.path);
//   await prefs.setString(photoPath, finalFile.path);
//   return finalFile;
// }

// void openFileDevice(String path) {
//   OpenFile.open(path);
// }

// Future<FilePickerResult?> pickFileImage() async =>
//     await FilePicker.platform.pickFiles(type: FileType.image);

// Future<File> saveImage(FilePickerResult filePicked) async {
//   final file = filePicked.files.first;
//   return await saveFileToDocumentsDirectory(file);
// }

// // Future<String> readCounter(File filePth) async {
// //   try {
// //     // Read the file
// //     return await filePth.readAsString();
// //   } catch (e) {
// //     logger.wtf(e);
// //     rethrow ;
// //   }
// // }
