import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ICloudFirebase {
  // Future getDataFromCloud();
  Future<DocumentReference<Map<String, dynamic>>> sendDataToFireStore(
    String collectionPath,
    Map<String, dynamic> data,
  );
  Stream receivedDataToFireStore({
    required String collectionPath,
    String? orderBy,
  });
  CollectionReference accessToCollection(String root);
}
