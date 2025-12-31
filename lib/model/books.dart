import 'package:bookhaven/model/book.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Books extends ChangeNotifier{

  Books({required this.books});
  List<Book> books;


  factory Books.fromJson(Map<String,dynamic> json){
    List<dynamic> jsonBooks = json['books'];

     Rating? RatingCheck(dynamic json){
      if(json!=null){
        if(json['rating']!=null){
          return Rating(average: (json['rating']['average'] ?? 0 as num).toDouble());
        }
        else{
          return null;
        }
      }
    else{
      return null;
    }
    }

    List<String>? genreCheck(dynamic json){
    //print("JSON VALUE \n ${json}");
      if((json as Map<String,dynamic>).containsKey('genres')){
        if(json['genres'] != null){
          return (json['genres'] as List).map((x) => x.toString()).toList();
        }
        else{
          return [];
        }
      } else{
        return [];
      }
    }

    String? descriptionCheck(dynamic json){
      if(json['description']!=null){
        return json['description'];
      }else{
        return null;
      }
    }

    double? yearCheck(dynamic json){
    if(json['publish_date']!=null){
      return json['publish_date'] as double;
    }else{
      return null;
    }
    }

    Identifier? identifierCheck(dynamic json){
      if(json['identifiers']!=null){
        return Identifier(openLibraryID: json['identifiers']['open_library_id'], isbn10: json['identifiers']['isbn_10'], isbn13: json['identifiers']['isbn_13']);
      } else{
        return null;
      }
    }
    
    List<Book> arrayBooks = [];
    for(dynamic book1 in jsonBooks){
      arrayBooks.add(
        Book(
          id: book1[0]['id'], 
          title: book1[0]['title'], 
          image: book1[0]['image'], 
          genre: genreCheck(book1[0]),
          authors: (book1[0]['authors'] as List)
          .map((a) => Authors(
                id: a['id'],
                name: a['name'],
              ))
          .toList(), 
          rating: RatingCheck(book1[0]),
          description: descriptionCheck(book1[0]),
          year:yearCheck(book1[0]),
          identifier: identifierCheck(book1[0])
        )
      );
    }

    return Books(
      books: arrayBooks,
    );
  }
}