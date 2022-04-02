import 'package:cloud_firestore/cloud_firestore.dart';

class Data {
  final String Name;
  final String RegdNo;

  Data(
      {required this.Name,
      required this.RegdNo,
      });

  Map<String, dynamic> toMap() {
    return {
      'Name': Name,
      'RegdNo': RegdNo,
    
    };
    
  }

  static fromDocumentSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> docSnapshot) {}}