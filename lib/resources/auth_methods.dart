import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wiz/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //sign up user
  Future<String> signupLearner({
    required String email,
    required String password,
    required String name,
    required String regdNo,
    required Uint8List file,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
              password.isNotEmpty ||
              name.isNotEmpty ||
              regdNo.isNotEmpty
          // file != null
          ) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage("profilePics", file, false); 

        //add user to learner database
        await _firestore.collection('learner').doc(cred.user!.uid).set({
          'name': name,
          'uid': cred.user!.uid,
          'email': email,
          'regdNo': regdNo,
          'photoUrl': photoUrl,
        });
        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
//sign up Educator
  Future<String> signupEducator({
    required String email,
    required String password,
    required String name,
    required String regdNo,
    required Uint8List file,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
              password.isNotEmpty ||
              name.isNotEmpty ||
              regdNo.isNotEmpty
          // file != null
          ) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage("profilePics", file, false); 

        //add user to Educator database
        await _firestore.collection('learner').doc(cred.user!.uid).set({
          'name': name,
          'uid': cred.user!.uid,
          'email': email,
          'regdNo': regdNo,
          'photoUrl': photoUrl,
        });
        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
  // logging in user
  Future<String> loginUser( {
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
        print('successful');
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

}


