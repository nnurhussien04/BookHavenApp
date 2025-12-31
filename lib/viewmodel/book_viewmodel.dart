
import 'package:bookhaven/model/book.dart';
import 'package:bookhaven/model/books.dart';
import 'package:bookhaven/service/book_service.dart';
import 'package:flutter/material.dart';

class BookViewModel extends ChangeNotifier{
  BookService _bookService = BookService();
  bool isLoading = false;

  Future<Books> searchValue(String search,[bool intial = false]) async{
    isLoading = true;
    if(!intial)
      notifyListeners();
    var searched = await _bookService.searchBooks(search);
    // for(Book book in searched.books){
    //   print(book.rating?.average);
    // }
    isLoading = false;
    if(!intial)
      notifyListeners();
    return searched;
  }

  Future<Books> searchGenre(String genre) async{
    isLoading = true;
    notifyListeners();
    var searched = await _bookService.searchGenres(genre);
    // for(Book book in searched.books){
    //   print(book.rating?.average);
    // }
    isLoading = false;
    notifyListeners();
    return searched;
  }

  Future<Book> searchDetails(int id) async{
    isLoading = true;
    notifyListeners();
    var searched = await _bookService.getBookDetails(id);
    isLoading = false;
    notifyListeners();
    return searched;
  }

}