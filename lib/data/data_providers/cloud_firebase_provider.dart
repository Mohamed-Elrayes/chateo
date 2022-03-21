import 'package:chateo/data/interface/i_cloud_firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirebaseProvider implements ICloudFirebase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<DocumentReference<Map<String, dynamic>>> sendDataToFireStore(
          String collectionPath, Map<String, dynamic> data) =>
      firestore.collection(collectionPath).add(data);

  @override
  Stream<QuerySnapshot> receivedDataToFireStore(
      {required String collectionPath, String? orderBy}) {
    final _collection = accessToCollection(collectionPath);
    if (orderBy != null) {
      return _collection.orderBy(orderBy, descending: true).snapshots();
    } else {
      return _collection.snapshots();
    }
  }

  @override
  CollectionReference<Object?> accessToCollection(String root) =>
      firestore.collection(root);
}
