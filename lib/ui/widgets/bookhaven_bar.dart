import 'package:bookhaven/provider/user_provider.dart';
import 'package:bookhaven/ui/screen/browse_page.dart';
import 'package:bookhaven/ui/screen/favourites.dart';
import 'package:bookhaven/ui/screen/homepage.dart';
import 'package:bookhaven/ui/screen/login.dart';
import 'package:bookhaven/viewmodel/login_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';

class BookhavenBar extends StatefulWidget implements PreferredSizeWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BookhavenBarState();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  Size.fromHeight(60);

}

class _BookhavenBarState extends State<BookhavenBar>{
  LoginViewModel loginViewModel = LoginViewModel();
  @override
  Widget build(BuildContext context) {
    final _userProvider = context.watch<UserProvider>();
    // TODO: implement build
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: Border.symmetric(horizontal: BorderSide(width: 1.0,color: Color(0xFFE6DFD6))),
      //surfaceTintColor: Colors.transparent,
      title: Row(
        spacing: 2,
        children: [
          Icon(Icons.menu_book_outlined),
          InkWell(
            child: Text(
              'BookHaven',
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                foreground: Paint()..shader = ui.Gradient.linear(Offset(0, 0), Offset(175, 0), [Colors.orange,Colors.blue])
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Homepage()));
            },
          )
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            children: [
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => BrowsePage()));                      
                }, 
                child: Text('Browse'),
              ),
              SizedBox(width: 5),
              !_userProvider.loggedIn! ?
              TextButton.icon(
                onPressed: (){
                  //print(_userProvider.loggedIn);
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => LoginPage()));
                }, 
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFF08D2D),
                  foregroundColor: Colors.white,
                  //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                icon: Icon(Icons.person_outlined),
                label: Text('Sign In'))
              : Row(
                children: [
                  IconButton(
                    color: Colors.black,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => FavouritePage()));
                    },
                    icon: Icon(Icons.favorite_border)
                  ),
                  IconButton(
                    color: Colors.black,
                    onPressed: (){
                      loginViewModel.logout(context);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
                    }, 
                    icon: Icon(Icons.logout)
                  )
                ],
              ) 
            ],
          ),
        )
      ],
    );
  }
  
}