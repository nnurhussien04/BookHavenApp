import 'package:bookhaven/model/book.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Books extends ChangeNotifier{

  Books({required this.books});
  List<Book> books;


  factory Books.fromJson(Map<String,dynamic> json){
    List<dynamic> jsonBooks = json['books'];
    
    List<Book> arrayBooks = [];
    for(dynamic book1 in jsonBooks){
      arrayBooks.add(
        Book(
          id: book1[0]['id'], 
          title: book1[0]['title'], 
          image: book1[0]['image'], 
          authors: book1[0]['authors'], 
          rating: book1[0]['rating']
        )
      );
    }
    return Books(
      books: arrayBooks,
    );
  }
}