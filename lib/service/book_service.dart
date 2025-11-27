import 'dart:convert';

import 'package:bookhaven/model/books.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
class BookService {

BookService();


Future<Books> getBooks(String search) async{
  var request = await http.get(Uri.parse('https://api.bigbookapi.com/search-books?query=$search&api-key=b6c52e13fd6d44b0904098825a6ad866'));

  if(request.statusCode == 200){
    return Books.fromJson(jsonDecode(request.body) as Map<String,dynamic>);
  } else{
    throw Exception('Failed to load books');
  }
}


}