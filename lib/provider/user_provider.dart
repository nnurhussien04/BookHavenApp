import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class UserProvider extends ChangeNotifier{
  UserCredential? _userCredential;
  bool? _loggedIn;

  UserProvider(){
    _loggedIn ??=false;
  }

  UserCredential? get userCredential => _userCredential;
  set userCredential(UserCredential? user){
    _userCredential = user;
    notifyListeners();
  }
  

  bool? get loggedIn => _loggedIn;
  set loggedIn(bool? status){
    _loggedIn = status;
    notifyListeners();
  }




  

}