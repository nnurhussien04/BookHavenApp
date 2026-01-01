import 'package:bookhaven/provider/favourites_provider.dart';
import 'package:bookhaven/provider/user_provider.dart';
import 'package:bookhaven/ui/screen/browse_page.dart';
import 'package:bookhaven/ui/screen/favourites.dart';
import 'package:bookhaven/ui/screen/homepage.dart';
import 'package:bookhaven/ui/screen/login.dart';
import 'package:bookhaven/viewmodel/book_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookhavenApp extends StatelessWidget {
  BookhavenApp({super.key});

  

  @override
  Widget build(BuildContext context) {
    final favouriteProvider = FavouritesProvider();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => UserProvider()),
        ChangeNotifierProvider(create: (ctx) => BookViewModel()),
        ChangeNotifierProvider(create: (ctx) => favouriteProvider)
      ],
      child: MaterialApp(
        navigatorObservers: [favouriteProvider.routeObserver],
        home: Homepage(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          //primaryColor: Colors.orange,
          iconTheme: IconThemeData(color: Colors.orange),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.orange,
            centerTitle: false,
            titleTextStyle: TextStyle(
              fontSize: 20,
              letterSpacing: -1
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
          ),
          textTheme: TextTheme(
            headlineMedium: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            headlineLarge: TextStyle(
              fontWeight: FontWeight.bold
            ),
            headlineSmall: TextStyle(
              fontWeight: FontWeight.bold
            )
          ),
          toggleButtonsTheme: ToggleButtonsThemeData(
            fillColor: Colors.white       )
        ),
      ),
    );
  }
}