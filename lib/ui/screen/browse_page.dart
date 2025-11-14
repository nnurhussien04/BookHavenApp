import 'package:bookhaven/ui/widgets/bookhaven_bar.dart';
import 'package:bookhaven/ui/widgets/dropdown_menu.dart';
import 'package:bookhaven/ui/widgets/favourite_grid.dart';
import 'package:flutter/material.dart';

class BrowsePage extends StatelessWidget {
  const BrowsePage({super.key});

  @override
  Widget build(BuildContext context) {
    var imageURLs = List.generate(10, (i) => 'https://covers.openlibrary.org/b/id/240727-L.jpg');
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
                    ),
                  ),
                  SizedBox(height: 5),
                  FilterDropDown(),
                  SizedBox(height: 15),
                  FavouritesGrid(imageURLs: imageURLs),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



