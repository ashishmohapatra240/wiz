import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wiz/models/data.dart';

class DatabaseService{
  final FirebaseFirestore _db = FirebaseFirestore.instance;


  Future<List> retrieveEmployees() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Employees").get();
    return snapshot.docs
        .map((docSnapshot) => Data.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}