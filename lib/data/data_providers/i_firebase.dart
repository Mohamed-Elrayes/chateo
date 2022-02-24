import 'dart:io';


abstract class FirebaseMethod {
  Future<String> uploadFile({required File imageToUpload});
  
}