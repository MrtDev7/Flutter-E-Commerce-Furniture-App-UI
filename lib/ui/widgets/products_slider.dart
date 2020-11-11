import 'package:app/models/models.dart';
import 'package:app/ui/style.dart';
import 'package:app/ui/widgets/widgets.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class ProductsSlider extends StatelessWidget {
  final List<Product> products;
  final String title;
  final Function more;
  const ProductsSlider(
      {Key key,
      @required this.products,
      @required this.title,
      @required this.more})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: <Widget>[
          _SliderHeader(title: title, onTap: more),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            height: 350,
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                Product product = products[index];
                return ProductItem(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SliderHeader extends StatelessWidget {
  final String title;
  final Function onTap;
  const _SliderHeader({Key key, @required this.title, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Color(KPrimaryColor),
                fontSize: 18,
                letterSpacing: 1.1,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 6,
              width: 6,
              decoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => onTap,
          child: Icon(
            EvaIcons.options2Outline,
            color: Color(KPrimaryColor),
          ),
        ),
      ],
    );
  }
}
