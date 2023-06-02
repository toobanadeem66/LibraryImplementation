import 'dart:convert';

class BookList {
  final String name;
  final String ImgURL;
  final List Authors;
  final String publisher;
  String ISBN = "";
  bool isFav;

  BookList({
    required this.ISBN,
    required this.isFav,
    required this.name,
    required this.ImgURL,
    required this.Authors,
    required this.publisher,
  });

  static BookList fromJson(Map<String, dynamic> json, String id) {
    var firebaseData = [];
    firebaseData = json['authors'] ?? [];

    List<String> authors = [];
    for (var id in firebaseData) {
      authors.add(id);
    }

    return BookList(
      name: json['bookName'] as String? ?? '',
      ImgURL: json['imgUrl'] as String? ?? '',
      // Authors: json['authors'] as List<String>? ?? [],
      Authors: authors,
      publisher: json['publisherName'] as String? ?? '',
      ISBN: id,
      isFav: json['isFav'] as bool? ?? false,
    );
  }

  toJson() {
    // List<Map<String, dynamic>> result = [];
    // Authors.forEach((item) {
    //   result.add(jsonEncode(item));
    // });
    return {
      'bookName': name,
      'imgUrl': ImgURL,
      'isFav': isFav,
      'publisherName': publisher,
      'authors': Authors,
    };
  }
}
