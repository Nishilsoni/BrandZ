import 'package:cloud_firestore/cloud_firestore.dart';

class StorageService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveTemplate(Map<String, dynamic> data) async {
    await _db.collection('templates').add(data);
  }

  Stream<QuerySnapshot> getTemplates() {
    return _db.collection('templates').snapshots();
  }
}
