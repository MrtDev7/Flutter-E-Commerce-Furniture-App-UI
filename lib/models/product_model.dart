import 'package:flutter/cupertino.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final double rating;
  final String imgUrl;
  final bool isFavorite;
  final String description;
  final int reviews;
  final String category;

  Product({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.rating,
    @required this.imgUrl,
    this.isFavorite = false,
    this.description = '',
    @required this.reviews,
    @required this.category,
  });
}
