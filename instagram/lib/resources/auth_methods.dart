import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram/models/user.dart' as model;
import 'package:instagram/resources/storage.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection("users").doc(currentUser.uid).get();
    return model.User.fromSnap(snap);
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some Kind of error occurred ";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String photoUrl =
            await StorageMethods().uploadImage('profilePics', file, false);
        //add user to database
        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          following: [],
          followers: [],
          bio: bio,
          photoUrl: photoUrl,
        );
        await _firestore.collection('users').doc(cred.user!.uid).set(
              user.toJson(),
            );
        res = 'Success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //login user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some Kind of error occurred ";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = 'Please Enter all fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
