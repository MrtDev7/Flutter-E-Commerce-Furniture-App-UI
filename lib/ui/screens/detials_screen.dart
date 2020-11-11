import 'dart:ui';

import 'package:app/models/models.dart';
import 'package:app/ui/style.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetialsScreen extends StatelessWidget {
  final Product product;
  const DetialsScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(KBackgroundColor),
      appBar: PreferredSize(
        child: _DetialsAppBar(),
        preferredSize: Size(_size.width, 80.0),
      ),
      bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 21,
            ),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    color: Color(KPrimaryColor),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _DetialsItemCount()
              ],
            ),
          ),
      
      body:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.title,
                      style: const TextStyle(
                        color: Color(KPrimaryColor),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      product.category,
                      style: const TextStyle(
                        color: Color(KPrimaryColor),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        RatingBar(
                          initialRating: product.rating,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemSize: 18,
                          ratingWidget: RatingWidget(
                            full: Icon(
                              EvaIcons.heart,
                              size: 5,
                              color: Colors.orange,
                            ),
                            half: Icon(
                              EvaIcons.heart,
                              size: 5,
                              color: Colors.orange,
                            ),
                            empty: Icon(
                              EvaIcons.heartOutline,
                              size: 5,
                              color: Colors.orange,
                            ),
                          ),
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Reviews (${product.reviews})')
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      product.description,
                      style: const TextStyle(
                        color: Color(KPrimaryColor),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Hero(
                        tag: product.id,
                        child: Image.asset(
                          product.imgUrl,
                          height: 400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
        
        
    );
  }
}

class _DetialsItemCount extends StatefulWidget {
  _DetialsItemCount({Key key}) : super(key: key);

  @override
  __DetialsItemCountState createState() => __DetialsItemCountState();
}

class __DetialsItemCountState extends State<_DetialsItemCount> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                index += 1;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.add,
                  size: 23,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Text(
            '${index}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (index > 0) {
                  index -= 1;
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.remove,
                  size: 23,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetialsAppBar extends StatelessWidget {
  const _DetialsAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 25,
              ),
            ),
            GestureDetector(
              onTap: () => print('like'),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(KPrimaryColor),
                ),
                child: Icon(
                  EvaIcons.heart,
                  size: 13,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
