import 'package:flutter/material.dart';
import 'package:flutterdemo/model/booklist_model.dart';
import 'package:flutterdemo/views/widgets.dart';
import 'package:provider/provider.dart';

import '../provider/booksprovider.dart';

class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final authorsController = TextEditingController();
  final bookNameController = TextEditingController();
  final publisherController = TextEditingController();
  final imgUrlController = TextEditingController();
  List<String> authors = [];

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    authorsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final books = context.watch<BooksProvider>().books;
    print(authors);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Book"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: bookNameController,
                decoration: InputDecoration(
                  hintText: "Book Name",
                  fillColor: const Color.fromARGB(92, 158, 158, 158),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: authorsController,
                decoration: InputDecoration(
                  hintText: "Authors",
                  prefixIcon: InkWell(
                    child: Icon(Icons.add),
                    onTap: () {
                      if (authorsController.text.isNotEmpty) {
                        authors.add(authorsController.text);
                        setState(() {});
                        authorsController.clear();
                      }
                    },
                  ),
                  fillColor: const Color.fromARGB(92, 158, 158, 158),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            Text("Authors:"),
            Text(
              authors.toString(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: publisherController,
                decoration: InputDecoration(
                  hintText: "Publisher Name",
                  fillColor: const Color.fromARGB(92, 158, 158, 158),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextFormField(

            //     decoration: InputDecoration(
            //       hintText: "ISBN Number",
            //       fillColor: const Color.fromARGB(92, 158, 158, 158),
            //       border: OutlineInputBorder(
            //         borderSide: BorderSide(
            //           color: Colors.black,
            //         ),
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: Colors.black, width: 1.5),
            //         borderRadius: BorderRadius.circular(25.0),
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: imgUrlController,
                decoration: InputDecoration(
                  hintText: "Image URL",
                  fillColor: const Color.fromARGB(92, 158, 158, 158),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  context.read<BooksProvider>().addBook(
                      bookNameController.text,
                      publisherController.text,
                      authors,
                      imgUrlController.text,
                      false);
                  bookNameController.clear();
                  publisherController.clear();
                  imgUrlController.clear();
                  authors.clear();
                  context.read<BooksProvider>().fetchBooks();
                },
                child: Text("Add Book"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
