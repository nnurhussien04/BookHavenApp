import 'package:bookhaven/ui/widgets/bookhaven_bar.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {

  final _content = Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    spacing: 15,
    children: [
      Center(child: Text('You haven\'t added any favorites yet')),
      Center(child: InkWell(child: Text('Browse books to get started',style: TextStyle(color: Color(0xFFF08D2D)),),onTap: (){}))
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BookhavenBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20,10,8,8),
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text('My Favorites',style: Theme.of(context).textTheme.headlineLarge),
                Text('My personal collection of favorite books')
              ],
            )
          ),
          SizedBox(height: 50),
          _content
        ],
      ),
    );
  }
}

