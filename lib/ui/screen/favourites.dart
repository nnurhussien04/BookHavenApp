import 'package:bookhaven/model/books.dart';
import 'package:bookhaven/provider/favourites_provider.dart';
import 'package:bookhaven/provider/user_provider.dart';
import 'package:bookhaven/ui/screen/browse_page.dart';
import 'package:bookhaven/ui/widgets/bookhaven_bar.dart';
import 'package:bookhaven/ui/widgets/favourite_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> with RouteAware{
  Widget? _content;
  FavouritesProvider? _favouritesProvider;
  late UserProvider _userProvider;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   _favouritesProvider = context.read<FavouritesProvider>();
   
    WidgetsBinding.instance.addPostFrameCallback((_){ //Calls method once bulid method complete
      _favouritesProvider!.getFavourites(context);
    });
    if(_favouritesProvider!.favourites.isEmpty){
      _content = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 15,
      children: [
        Center(child: Text('You haven\'t added any favorites yet')),
        Center(
          child: InkWell(
            child: Text(
              'Browse books to get started',
              style: TextStyle(color: Color(0xFFF08D2D))),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (ctx) => BrowsePage()));
              }
        )
      )
      ],
    );
    } else{
      _content = FavouritesGrid(imageURLs: [], catalogue: Books(books: _favouritesProvider!.favourites));
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _userProvider = context.read<UserProvider>();  
  }

  @override
  void dispose() {
    _favouritesProvider!.storeFavourites(_userProvider);
    _favouritesProvider!.routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPop() {
    _favouritesProvider!.storeFavourites(_userProvider);
  }

  @override
  void didPopNext() {
    _favouritesProvider!.storeFavourites(_userProvider);
  }


  @override
  Widget build(BuildContext context) {
    _favouritesProvider = context.watch<FavouritesProvider>();
    if(_favouritesProvider!.favourites.isNotEmpty){
      _content = _content = FavouritesGrid(imageURLs: [], catalogue: Books(books: _favouritesProvider!.favourites));
    }

    if(_favouritesProvider!.isLoading){
      _content = Center(
        child: CircularProgressIndicator(),
      );
    } else{
        if(_favouritesProvider!.favourites.isEmpty){
            _content = Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 15,
            children: [
              Center(child: Text('You haven\'t added any favorites yet')),
              Center(
                child: InkWell(
                  child: Text(
                    'Browse books to get started',
                    style: TextStyle(color: Color(0xFFF08D2D))),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) => BrowsePage()));
                    }
              )
            )
            ],
          );
      } else{
        _content = FavouritesGrid(imageURLs: [], catalogue: Books(books: _favouritesProvider!.favourites));
      }
    }

    return Scaffold(
      appBar: BookhavenBar(),
      body: SingleChildScrollView(
        child: Column(
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
            _content!
          ],
        ),
      ),
    );
  }
}

