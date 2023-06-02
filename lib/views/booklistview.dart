import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterdemo/model/booklist_model.dart';
import 'package:flutterdemo/views/addbook.dart';
import 'package:flutterdemo/views/book_detail.dart';
import 'package:flutterdemo/views/widgets.dart';
import 'package:provider/provider.dart';
import '../provider/booksprovider.dart';

class BookListView extends StatefulWidget {
  const BookListView({super.key});

  @override
  State<BookListView> createState() => _BookListViewState();
}

class _BookListViewState extends State<BookListView> {
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<BooksProvider>().fetchBooks();
  
    });
  }

  @override
  Widget build(BuildContext context) {
    final books = context.watch<BooksProvider>().books;
    return Scaffold(
      appBar: AppBar(
        title: Text("Book List View"),
      ),
      body: context.watch<BooksProvider>().isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.blueGrey),
                          ),
                          tileColor: Color.fromARGB(77, 177, 229, 255),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => BookDetail(
                                  bookName: books[index].name,
                                  ISBN: books[index].ISBN,
                                  authors: books[index].Authors,
                                  publisherName: books[index].publisher,
                                  imgUrl: books[index].ImgURL,
                                ),
                              ),
                            );
                          },
                          leading: CircleAvatar(
                            backgroundColor: const Color(0xff764abc),
                            backgroundImage: NetworkImage(books[index].ImgURL),
                          ),
                          title: Text(books[index].name),
                          subtitle: Text(books[index]
                              .Authors
                              .toString()
                              .substring(1,
                                  books[index].Authors.toString().length - 1)),
                          trailing: FavouriteIcon(
                            isFav: books[index].isFav,
                            onTap: () {
                              books[index].isFav = !books[index].isFav;

                              setState(() {});
                              context.read<BooksProvider>().isFavourite(
                                  books[index].ISBN, books[index].isFav);
                            },
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddBook()),
          );
        }),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
