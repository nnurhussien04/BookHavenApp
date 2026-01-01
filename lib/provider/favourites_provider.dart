import 'package:bookhaven/model/book.dart';
import 'package:bookhaven/provider/user_provider.dart';
import 'package:bookhaven/viewmodel/book_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesProvider extends ChangeNotifier{

  FavouritesProvider();


  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
  List<Book> _favourites = [];
  List<Book> get favourites => _favourites;
  bool isLoading = false;
  bool disposed = false;
  

  set setFavourites (List<Book> book) {
    book = _favourites;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    disposed = true;
    super.dispose();
  }

  void cancelRequests() {
    disposed = true;
    notifyListeners();
  }

  void resetDispose(){
    disposed = false;
    notifyListeners();
  }



  void addFavourites(Book book){
    _favourites.add(book);
    notifyListeners();
  }

  void removeFavourites(Book book){
    _favourites.removeWhere((b) => b.title == book.title);
    notifyListeners();
  }

  void storeFavourites(UserProvider userProvider){
    List<int> idArray = [];
    idArray.addAll(favourites.map((x) => x.id));

    if (userProvider.userCredential == null) return;

    FirebaseFirestore.instance
          .collection('users')
          .doc(
          userProvider.userCredential?.user?.email)
          .set(
            {
              "ID": idArray
            }
          );
  }

  void getFavourites(BuildContext context) async{
    var userProvider = context.read<UserProvider>();
      isLoading = true;
      notifyListeners();
      if(userProvider.userCredential!=null){
        if(disposed){
          isLoading = false;
          notifyListeners();
          return;
        }
        var favourites = await FirebaseFirestore.instance.collection('users')
        .doc(userProvider.userCredential?.user?.email).get();

        var favouritesData = favourites.data();
        if(favouritesData == null){
          isLoading = false;
          notifyListeners(); 
          return;
        }


      final List<dynamic>? favouritesID = favouritesData['ID'] as List<dynamic>?;
      if (favouritesID == null || favouritesID.isEmpty){
        isLoading = false;
        notifyListeners(); 
        return;
      }


        var bookViewModel = BookViewModel();
        for (final id in favouritesID) {
          if(disposed) return;
          await Future.delayed(const Duration(seconds: 1));
          final book = await bookViewModel.searchDetails(id);

          if (_favourites.every((b) => b.title != book.title)) {
            _favourites.add(book);
            notifyListeners();
          }
        }
    }

    isLoading = false;
    notifyListeners(); 
  }

  void clearFavourites(){
    _favourites = [];
    notifyListeners();
  }


}