import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookhaven/model/book.dart';
import 'package:bookhaven/ui/screen/browse_page.dart';
import 'package:bookhaven/ui/shared/genre_values.dart';
import 'package:bookhaven/ui/widgets/bookhaven_bar.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key,required this.book,required this.selectedGenre});
  final Book book;
  final String? selectedGenre;

  

  @override
  Widget build(BuildContext context) {
    String genre = 'genre';
    if(book.genre!.isNotEmpty){
      genre = book.genre!
      .firstWhere((x){
        if(selectedGenre == 'Science Fiction'){
          return x == 'science_fiction';
        }
        return x == genreValues[selectedGenre];
      });
    }
    return Scaffold(
      appBar: BookhavenBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 20),
              TextButton.icon(onPressed: (){Navigator.pop(context);}, label: Text('Back'),icon: Icon(Icons.arrow_back)),
              Container(
                padding: EdgeInsets.all(12),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Image.network(
                  book.image ?? "https://m.media-amazon.com/images/S/compressed.photo.goodreads.com/books/1626027328i/58534338.jpg",
                  scale: 0.4,
                  errorBuilder: (context, error, stackTrace) => Image.network("https://m.media-amazon.com/images/S/compressed.photo.goodreads.com/books/1626027328i/58534338.jpg"),      
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FilledButton.icon(onPressed: (){}, label: Text('Add To Favourites',style: TextStyle(letterSpacing: -1,fontWeight: FontWeight.bold,fontSize: 12),), icon: Icon(Icons.favorite_outline),style: FilledButton.styleFrom(backgroundColor: Color(0xFFF08D2D),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(book.title!,style: Theme.of(context).textTheme.headlineLarge),
              ),
              SizedBox(height: 5),
              Column(crossAxisAlignment: CrossAxisAlignment.start ,children: [...book.authors!.map((author) => Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text('by ${author.name}',style: TextStyle(letterSpacing: -1,color: Colors.black45,fontSize: 20,fontWeight: FontWeight.w500)),
              )).toList()]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(("${genre.substring(0,1).toUpperCase()}${genre.substring(1)}"),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,letterSpacing: 0),overflow: TextOverflow.ellipsis),
              ),
              if(book.rating!=null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(spacing: 5,children: [Icon(Icons.star),RichText(text: TextSpan(text: book.rating!.average.toStringAsFixed(1),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15),children: [TextSpan(text: ' / 1.0',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w400))]))],)
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('About this book',style: Theme.of(context).textTheme.headlineSmall,),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(book.description,style: Theme.of(context).textTheme.headlineSmall,),
              // )
            ],
          ),
        ),
      ),
    );
  }
}