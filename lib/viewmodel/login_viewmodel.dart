import 'package:bookhaven/provider/user_provider.dart';
import 'package:bookhaven/ui/screen/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _firebase = FirebaseAuth.instance;
class LoginViewModel {

  void signUpUser(String email,String password,BuildContext context) async{
    final userProvider = context.read<UserProvider>();
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
    if(_firebase.currentUser != null){
      userProvider.loggedIn = true;
      userProvider.userCredential = userCredentials;
      if(context.mounted){
          ScaffoldMessenger.of(context).clearSnackBars();
          Navigator.push(context, MaterialPageRoute(builder: (ctx) => Homepage()));
        }
    }
  }

  void login(String email,String password,BuildContext context) async{
    final userProvider = context.read<UserProvider>();
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
      userProvider.loggedIn = true;
      userProvider.userCredential = userCredentials;
      if(context.mounted){
        ScaffoldMessenger.of(context).clearSnackBars();
        Navigator.push(context, MaterialPageRoute(builder: (ctx) => Homepage()));
      }
    }
  }

  void logout(BuildContext context) async{
    await _firebase.signOut();
    if(context.mounted){
      final userProvider = context.read<UserProvider>();
      userProvider.userCredential = null;
      userProvider.loggedIn = false;
    }
  }

  



}