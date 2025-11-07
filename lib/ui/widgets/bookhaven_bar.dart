import 'package:flutter/material.dart';
import 'dart:ui' as ui;

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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Row(
        spacing: 2,
        children: [
          Icon(Icons.book_outlined),
          Text(
            'BookHaven',
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              foreground: Paint()..shader = ui.Gradient.linear(Offset(0, 0), Offset(230, 0), [Colors.orange,Colors.blue])
            ),
          )
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            children: [
              TextButton(
                onPressed: (){}, 
                child: Text('Browse'),
              ),
              SizedBox(width: 5),
              TextButton.icon(
                onPressed: (){}, 
                style: TextButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                icon: Icon(Icons.person_outlined),
                label: Text('Sign In')),
            ],
          ),
        )
      ],
    );
  }
  
}