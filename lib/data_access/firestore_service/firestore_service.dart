import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/data_access/firestore_service/a_firestore_service.dart';

class FirestoreService extends AFirestoreService {
  final _firestore = FirebaseFirestore.instance;

  void add(String collectionName, Map<String, dynamic> data) {
    _firestore.collection(collectionName).add(data);
  }
}
