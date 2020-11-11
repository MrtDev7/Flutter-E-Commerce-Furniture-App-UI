import 'dart:ui';

import 'package:app/data/data.dart';
import 'package:app/models/models.dart';
import 'package:app/ui/style.dart';
import 'package:flutter/material.dart';

class CategorySlider extends StatelessWidget {
  final List<Category> content;
  final String title;
  const CategorySlider({Key key, @required this.content, this.title = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: ListView.builder(
          itemCount: content.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            Category category = categorys[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color(KSecondaryColor),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    height: 160,
                    width: 140,
                  ),
                  Positioned(
                    bottom: 15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Image.asset(
                          category.imgUrl,
                          height: 150,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          category.title,
                          style: const TextStyle(
                            color: Color(KPrimaryColor),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
