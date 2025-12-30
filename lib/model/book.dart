import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Book{
  Book({required this.id, this.title, this.image, this.genre, this.authors, this.rating});

  final int id;
  final String? title;
  final String? image;
  final List<String>? genre;
  final List<Authors>? authors;
  final Rating? rating;

}

class Authors{
  Authors({required this.id,required this.name});

  final int id;
  final String name;

  factory Authors.fromJson(Map<String, dynamic> json) {
    return Authors(
      id: json['id'],
      name: json['name'],
    );
  }

  
}

class Rating{
  Rating({required this.average});
  final double average;

    factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: (json['average'] as double),
    );
  }
}