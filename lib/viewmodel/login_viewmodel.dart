import 'package:bookhaven/ui/screen/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;
class LoginViewModel {

  void signUpUser(String email,String password,BuildContext context) async{
    UserCredential? userCredentials;
    try{
      userCredentials = await _firebase.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(error){
      if(context.mounted){
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message ?? 'Authentication Failed'))
        );
      }
    }
  }

  void login(String email,String password,BuildContext context) async{
    UserCredential? userCredentials;
    try{
      userCredentials = await _firebase.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(error){
      if(context.mounted){
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message ?? 'Authentication Failed'),
            duration: Duration(seconds: 5),
          )
        );
      }
    }
    if(userCredentials != null){
         if(context.mounted){
          ScaffoldMessenger.of(context).clearSnackBars();
          Navigator.push(context, MaterialPageRoute(builder: (ctx) => Homepage()));
        }
    }

  }


}