import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BookImage extends StatefulWidget {
  const BookImage({super.key, required this.url});
  final String url;

  @override
  State<BookImage> createState() => _BookImageState();
}

class _BookImageState extends State<BookImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(widget.url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class FavouriteIcon extends StatefulWidget {
  const FavouriteIcon({super.key, required this.isFav, required this.onTap});
  final bool isFav;
  final VoidCallback onTap;

  @override
  State<FavouriteIcon> createState() => _FavouriteIconState();
}

class _FavouriteIconState extends State<FavouriteIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: widget.isFav == true
          ? Icon(
              Icons.favorite,
              color: Colors.red,
            )
          : Icon(
              Icons.favorite_outline,
              color: Colors.red,
            ),
    );
  }
}
