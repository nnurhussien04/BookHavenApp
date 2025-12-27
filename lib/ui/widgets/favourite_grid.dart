import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookhaven/model/books.dart';
import 'package:bookhaven/ui/shared/genre_values.dart';
import 'package:flutter/material.dart';

class FavouritesGrid extends StatelessWidget {
  FavouritesGrid({
    super.key,
    required this.imageURLs,
    required this.catalogue,
    this.selectedGenre,
    this.homepage = false
  });

  final List<String> imageURLs;
  final Books catalogue;
  final String? selectedGenre;
  String? value;
  bool homepage;

  genreCheck(){
    //print('SelectedGenre $selectedGenre');
    switch(selectedGenre){
      case 'All Categories':
        value = null;
        break;
      case 'Science Fiction':
        value = 'science_fiction';
        break;
      default:
        value = genreValues[selectedGenre];
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    genreCheck();
    //print("Value $value");
    return GridView.builder(
    clipBehavior: Clip.hardEdge,
    padding: EdgeInsets.zero,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(), //Stops 
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.46,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5
    ),
    itemCount: catalogue.books.length,
    itemBuilder: (context, index) {
      //print(catalogue.books[index].genre);
      return Card(
        color: Colors.white,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: homepage ? 230 :(catalogue.books[index].authors!.length > 1 ? 210:260),
              width: double.infinity,
              child: Image.network(
                fit: BoxFit.fill,
                catalogue.books[index].image ?? 'https://m.media-amazon.com/images/S/compressed.photo.goodreads.com/books/1626027328i/58534338.jpg',
                errorBuilder: (ctx,_,_){ return Image.network('https://m.media-amazon.com/images/S/compressed.photo.goodreads.com/books/1626027328i/58534338.jpg');},
              ) ,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0,12.0,12.0,0),
              child: Column(
                spacing: 2,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(catalogue.books[index].title ?? 'Title',style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: -1),maxLines: 1, overflow: TextOverflow.ellipsis,),
                  if(catalogue.books[index].authors != null || catalogue.books[index].authors!.isNotEmpty)
                    ...catalogue.books[index].authors!.map((e) => AutoSizeText(e.name,style: TextStyle(letterSpacing: -1,color: Colors.black54,fontWeight: FontWeight.w500),maxLines: 1,minFontSize: 5
                    ,),),
                  Row(children: [Icon(Icons.star,size: 14), SizedBox(width: 2) ,Text(catalogue.books[index].rating?.average.toString() ?? '0.0',style: TextStyle(fontWeight: FontWeight.w600),), Spacer(),Container(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Color(0xFFFFFBF5)), child: Text(value != null ? catalogue.books[index].genre!.where((x) => x == value!).single.substring(0,1).toUpperCase() +  catalogue.books[index].genre!.where((x) => x == value!).single.substring(1): 'Genre',style: TextStyle(fontSize: 12),))]),
                ],
              ),
            ),
            Center(child: TextButton.icon(onPressed: (){}, icon: Icon(Icons.favorite_outline) ,label: Text('Add to Favourites',style: TextStyle(fontSize: 13,letterSpacing: -1,wordSpacing: 1,fontWeight: FontWeight.w600))))  
          ],
        ),
      );
    },
    );
  }
}