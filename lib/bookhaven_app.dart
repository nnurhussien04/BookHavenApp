import 'package:bookhaven/ui/screen/homepage.dart';
import 'package:flutter/material.dart';

class BookhavenApp extends StatelessWidget {
  const BookhavenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        //primaryColor: Colors.orange,
        iconTheme: IconThemeData(color: Colors.orange),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.orange,
          centerTitle: false,
          titleTextStyle: TextStyle(
            fontSize: 20,
            letterSpacing: -1
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
        ),
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: -1
          )
        )
      ),
    );
  }
}