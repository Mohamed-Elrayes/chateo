// import 'package:firebase_storage/firebase_storage.dart';

// import 'dart:io';

// import '../../core/constants/api_constant.dart';
// import 'i_firebase.dart';

// class CloudStoreProvider implements ICloudFireStore {
//   @override
//   UploadTask? uploadFile({required String title, required File imageToUpload}) {
    
//     var imageFileName =
//         title + DateTime.now().microsecondsSinceEpoch.toString();
//     final Reference firebaseStorageRef =
//         FirebaseStorage.instance.ref(namePathFileOnFirebaseStorage).child(imageFileName);
//     UploadTask uploadTask = firebaseStorageRef.putFile(imageToUpload);

//     // await firebaseStorageRef.getDownloadURL();

//   }
// }
