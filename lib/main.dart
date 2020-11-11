import 'package:app/ui/screens/screens.dart';
import 'package:app/ui/style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NavScreen(),
    theme: ThemeData(
      primaryColor: Color(KPrimaryColor),
    ),
  ));
}
