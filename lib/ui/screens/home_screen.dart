import 'package:app/data/data.dart';
import 'package:app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(),
        preferredSize: Size(size.width, 80),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: CategorySlider(
                content: categorys,
              ),
            ),
            SliverToBoxAdapter(
              child: ProductsSlider(
                title: 'For you',
                products: foryou,
                more: () => print('more'),
              ),
            ),
            SliverToBoxAdapter(
              child: ProductsSlider(
                title: 'Chairs',
                products: chairs,
                more: () => print('more'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
