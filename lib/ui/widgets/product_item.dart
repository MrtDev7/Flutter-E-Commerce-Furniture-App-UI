import 'package:app/models/models.dart';
import 'package:app/ui/screens/screens.dart';
import 'package:app/ui/style.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetialsScreen(
              product:product
            ),
          ),
        );
      },
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: Color(KBackgroundColor),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(8),
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag:product.id,
                      child: Image.asset(
                        product.imgUrl,
                        height: 200,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    product.title,
                    style: const TextStyle(
                      color: Color(KPrimaryColor),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Chair',
                    style: const TextStyle(
                      color: Color(KPrimaryColor),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(
                            color: Color(KPrimaryColor),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            product.isFavorite
                ? Positioned(
                    right: 25,
                    top: 25,
                    child: GestureDetector(
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
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
