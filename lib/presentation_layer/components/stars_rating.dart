import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final int starCount;
  final double rating;
  final Color color;
  final double size;

  StarRating({this.starCount = 5, this.rating = 0.0,required this.color, this.size = 30.0});

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.starCount, (index) {
        return Icon(
          index < widget.rating.floor()
              ? Icons.star
              : Icons.star_border,
          color: widget.color ?? Theme.of(context).primaryColor,
          size: widget.size,
        );
      }),
    );
  }
}