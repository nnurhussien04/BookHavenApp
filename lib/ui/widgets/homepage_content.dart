import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class HomepageContent extends StatelessWidget {
  const HomepageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.menu_book,size: 60,),
        SizedBox(height: 20),
        Text(
          'Discover Your Next Great Read',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            height: 1,
            wordSpacing: -1,
            letterSpacing: -1,
            foreground: Paint()..shader = ui.Gradient.linear(Offset(0, 0), Offset(355, 0), [Colors.orange,Colors.blue])
          )
        ),
        SizedBox(height: 15),
        Text(
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.brown,
            letterSpacing: -1
            //foreground: Paint()..shader = ui.Gradient.linear(Offset(0, 0), Offset(400, 0), [Colors.orange,Colors.blue])
          ),
          'Explore thousands of books, save your favorites, and build your personal library'
        ),
        SizedBox(height: 20),
        TextButton.icon(
          onPressed: (){}, 
          icon: Icon(Icons.menu_book_outlined),
          label: Text('Browse Books'),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.orange,
            minimumSize: Size(double.infinity,40)
          ),
        ),
        TextButton(
          onPressed: (){},
          style: TextButton.styleFrom(minimumSize: Size(double.infinity,40)),
          child: Text('Get Started'))
      ],
    );
  }
}