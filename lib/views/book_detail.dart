import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterdemo/views/widgets.dart';

class BookDetail extends StatefulWidget {
  const BookDetail(
      {super.key,
      required this.bookName,
      required this.authors,
      required this.publisherName,
      required this.ISBN,
      required this.imgUrl});
  final String bookName;
  final List authors;
  final String publisherName;
  final String ISBN;
  final String imgUrl;

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Details"),
      ),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            BookImage(url: widget.imgUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.bookName,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Authors: " +
                    widget.authors.toString().substring(
                          1,
                          widget.authors.toString().length - 1,
                        ),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Publisher: " + widget.publisherName,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "ISBN: " + widget.ISBN,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
