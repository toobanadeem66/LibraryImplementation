import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/booklist_model.dart';

abstract class BooksRepository {
  Future<List<BookList>> getBookList();
  addBook(String bookName, String publisherName, List<String> authors,
      String imgUrl, bool isFav);

  isFavourite(String ISBN, bool isFav);
}

class FirebaseBooksRepository implements BooksRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<BookList>> getBookList() async {
    List<BookList> books = [];
    await db.collection("Book List").get().then(
      (event) {
        books =
            event.docs.map((e) => BookList.fromJson(e.data(), e.id)).toList();
      },
    );

    return books;
  }

  @override
  addBook(String bookName, String publisherName, List authors, String imgUrl,
      bool isFav) async {
    final data = BookList(
            Authors: authors,
            ImgURL: imgUrl,
            isFav: isFav,
            name: bookName,
            publisher: publisherName,
            ISBN: "")
        .toJson();

    await db
        .collection("Book List")
        .add(data)
        .then(
          (_) => print('Added'),
        )
        .catchError(
          (error) => print('Add failed: $error'),
        );
  }

  @override
  isFavourite(String ISBN, bool isFav) async {
    // TODO: implement isFavourite
    await db.collection("Book List").doc(ISBN).update({"isFav": isFav});
  }
}
