import 'package:cosmics/core/firebase/firebase_functions.dart';
import 'package:cosmics/core/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier{

  User? firebaseUser;
  UserModel? userModel;

  MyProvider(){
    firebaseUser = FirebaseAuth.instance.currentUser;
    if(firebaseUser != null){
      initUser();
    }
  }

  initUser()async{
    userModel = await FirebaseFunctions.readUser();
    notifyListeners();
  }
}