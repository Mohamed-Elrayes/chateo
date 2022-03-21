import 'dart:io';


abstract class IStorageFirebase {
  Future<String> uploadFile({required File imageToUpload});
}