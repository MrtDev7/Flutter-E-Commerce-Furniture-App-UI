import 'package:app/ui/style.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Expolore',
              style: const TextStyle(
                color: Color(KPrimaryColor),
                fontWeight: FontWeight.bold,
                fontSize: 27.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () => print('search'),
                  child: Icon(
                    EvaIcons.search,
                    color: Color(KPrimaryColor),
                    size: 30.0,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () => print('menu'),
                  child: Icon(
                    EvaIcons.menu2,
                    color: Color(KPrimaryColor),
                    size: 30.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
