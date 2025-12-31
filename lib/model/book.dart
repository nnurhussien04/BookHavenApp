import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Book{
  Book({required this.id, this.title, this.image, this.identifier, this.description, this.year,this.genre, this.authors, this.rating});

  final int id;
  final String? title;
  final String? image;
  final String? description;
  final double? year;
  final List<String>? genre;
  final List<Authors>? authors;
  final Rating? rating;
  final Identifier? identifier;


  factory Book.fromJson(Map<String,dynamic> json){
    return Book(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      description: json['description'],
      year: json['publish_date'],
      identifier: Identifier(
        openLibraryID: json['identifiers']['open_library_id'] ?? "", 
        isbn10: json['identifiers']['isbn_10'] ?? "", 
        isbn13: json['identifiers']['isbn_13'] ?? ""
      ),
      rating: json['rating']!= null ? Rating(average: json['rating']['average']) : null,
      authors: (json['authors'] as List).map((author) => Authors(
        id: author['id'],
        name: author['name']
      )).toList()


      );
  }

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

class Identifier{
  Identifier({required this.openLibraryID, required this.isbn10, required this.isbn13});
  final String openLibraryID;
  final String isbn10;
  final String isbn13;

  factory Identifier.fromJson(Map<String,dynamic> json){
    return Identifier(
      openLibraryID: json['open_library_id'], 
      isbn10: json['isbn_10'], 
      isbn13: json['isbn_13']
    );
  }
}