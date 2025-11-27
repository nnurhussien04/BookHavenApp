import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Book extends ChangeNotifier{
  Book({required this.id, required this.title, required this.image, required this.authors, required this.rating});

  final dynamic id;
  final String title;
  final String image;
  final List<dynamic> authors;
  final dynamic rating;





}