import 'package:flutter/material.dart';
import '../model/booklist_model.dart';
import '../repository/books_repository.dart';

class BooksProvider with ChangeNotifier {
  List<BookList> books = [];

  bool isLoading = false;

  final BooksRepository _booksRepository = FirebaseBooksRepository();

  void addBook(String bookName, String publisherName, List<String> authors,
      String imgUrl, bool isFav) async {
    await _booksRepository.addBook(
        bookName, publisherName, authors, imgUrl, isFav);
  }

  void fetchBooks() async {
    print('fetching books');
    isLoading = true;
    notifyListeners();
    books = await _booksRepository.getBookList();
    print('got books: ');
    isLoading = false;
    notifyListeners();
  }

  void isFavourite(String ISBN, bool isFav) async {
    print(isFav);
    await _booksRepository.isFavourite(ISBN, isFav);
  }
}
