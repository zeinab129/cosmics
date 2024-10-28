import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosmics/core/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseFunctions {
  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance.collection("users").withConverter(
      fromFirestore: (snapshot, options) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (user, options) {
        return user.toJson();
      },
    );
  }

  static createUserAccount(
      {required String email,
      required String password,
      required String name,
      required String title,
      required String imagePath,
      required Function onSuccess,
      required double progress,
      required Function onError}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String imageUrl = await uploadImage(imagePath) ?? "";
      UserModel user = UserModel(
          uid: credential.user?.uid ?? "",
          name: name,
          title: title,
          email: email,
          imageUrl: imageUrl,
          progress: progress,
          favPlanets: [],
          quizProgress: [0, 0, 0, 0, 0, 0, 0, 0]);
      addUser(user).then((value) {
        onSuccess();
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError('The account already exists for that email.');
      }
    } catch (e) {
      onError(e.toString());
    }
  }

  static login(
      {required String email,
      required String password,
      required Function onSuccess,
      required Function onError}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => onSuccess());
    } on FirebaseAuthException catch (e) {
      onError("Wrong email or password!");
    } catch (e) {
      onError(e.toString());
    }
  }

  static void logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> addUser(UserModel user) {
    var collection = getUsersCollection();
    var docRef = collection.doc(user.uid);
    return docRef.set(user);
  }

  static Future<void> updateUser(String uid, String key, dynamic value) {
    var collection = getUsersCollection();
    var docRef = collection.doc(uid);
    return docRef.update({key: value});
  }

  static Future<String?> uploadImage(String path) async {
    try {
      var storageRef = FirebaseStorage.instance.ref().child(path);
      var uploadTask = storageRef.putFile(File(path)!);
      var downloadUrl = await (await uploadTask).ref.getDownloadURL();
      return downloadUrl;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  static Future<UserModel?> readUser() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot<UserModel> documentSnapshot =
        await getUsersCollection().doc(uid).get();
    return documentSnapshot.data();
  }
}
