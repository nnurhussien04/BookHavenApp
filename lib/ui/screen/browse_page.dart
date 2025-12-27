import 'package:bookhaven/model/book.dart';
import 'package:bookhaven/model/books.dart';
import 'package:bookhaven/ui/shared/genre_values.dart';
import 'package:bookhaven/ui/widgets/bookhaven_bar.dart';
import 'package:bookhaven/ui/widgets/dropdown_menu.dart';
import 'package:bookhaven/ui/widgets/favourite_grid.dart';
import 'package:bookhaven/viewmodel/book_viewmodel.dart';
import 'package:bookhaven/viewmodel/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  Books? _content;
  BookViewModel? _bookViewModel;
  String? _selectedValue;

  Future<Books?> getBooks() async{
      await _bookViewModel!.searchValue('',true).then(
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

      _bookViewModel!.isLoading = false;
      _bookViewModel!.notifyListeners();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bookViewModel = context.read<BookViewModel>();
    try{
      getBooks();
    } catch(e){
      print(e.runtimeType);
    }
  }



  @override
  Widget build(BuildContext context) {
    _bookViewModel = context.watch<BookViewModel>();
    var imageURLs = List.generate(10, (i) => 'https://covers.openlibrary.org/b/id/240727-L.jpg');
    if(_bookViewModel!.isLoading || _content == null){
      return Scaffold(
        appBar: BookhavenBar(),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    else{
      return Scaffold(
        appBar: BookhavenBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text('Browse Books',style: Theme.of(context).textTheme.headlineLarge,),
                    SizedBox(height: 5),
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xFFE6DFD6),
                          width: 1.0
                        )
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(bottom: 0),
                          prefixIcon: Icon(Icons.search,color: Colors.black45,),
                          hintStyle: TextStyle(
                            letterSpacing: -1,
                            color: Colors.black45,
                            fontWeight: FontWeight.w500
                          ),
                          hintText: 'Search by title or author...'
                        ),
                        onSubmitted: (value) async{
                          if(value.isNotEmpty){
                            _selectedValue = null;
                            _content = await _bookViewModel!.searchValue(value);

                            if (!mounted) return;

                          }
                        },
                      ),
                    ),
                    SizedBox(height: 5),
                    FilterDropDown(
                      value: (value) async{
                        if(value == 'All Categories'){
                          _selectedValue = value;
                          getBooks();
                        } else{
                          _selectedValue = value;
                          _content = await _bookViewModel!.searchGenre(genreValues[value]!);
                          if (!mounted) return;

                        }
                    },
                    selectedValue: _selectedValue,
                  ),
                    SizedBox(height: 15),
                    FavouritesGrid(imageURLs: imageURLs,catalogue: _content!,selectedGenre: _selectedValue),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}



