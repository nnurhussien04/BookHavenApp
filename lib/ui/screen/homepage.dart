import 'dart:ui' as ui;

import 'package:bookhaven/model/book.dart';
import 'package:bookhaven/model/books.dart';
import 'package:bookhaven/ui/widgets/bookhaven_bar.dart';
import 'package:bookhaven/ui/widgets/favourite_grid.dart';
import 'package:bookhaven/ui/widgets/homepage_content.dart';
import 'package:bookhaven/viewmodel/book_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Books? _content;

  var imageURLs = List.generate(10, (i) => 'https://covers.openlibrary.org/b/id/240727-L.jpg');

    Future<Books?> getBooks(BookViewModel bookViewModel) async{
      await bookViewModel.searchValue('',true).then(
      (action){
        _content = action;
      }
    );
    
      _content ??= Books(
        books: List.filled(10,
          Book(
            id: 1,
            title: 'Title',
            image: 'https://covers.openlibrary.org/b/id/240727-L.jpg',
            authors: [Authors(id: 1, name: 'NN')],
            rating: Rating(average: 0.5)  
          )
        )
      );

      bookViewModel.isLoading = false;
      bookViewModel.notifyListeners();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BookViewModel _bookViewModel = context.read<BookViewModel>();
    getBooks(_bookViewModel);
  }

  @override
  Widget build(BuildContext context) {
    BookViewModel bookViewModel = context.watch<BookViewModel>();
    return Scaffold(
      backgroundColor: Color(0xffFAF8F6),
      appBar: BookhavenBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20,60,20,20),
          //margin: EdgeInsets.all(10),
          child: Column(
            spacing: 20,
            children: [
              HomepageContent(),
              SizedBox(height: 60),
              Row(
                spacing: 4.0,
                children: [
                Icon(Icons.trending_up),
                Text('Featured Books',style: Theme.of(context).textTheme.headlineMedium),
                ]
              ),
              if(!bookViewModel.isLoading || _content != null)
                FavouritesGrid(imageURLs: imageURLs, catalogue: _content!,homepage: true)
              else
                Center(child: CircularProgressIndicator())
            ],
          ),
        ),
      ),
    );
  }
}