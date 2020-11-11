import 'package:app/ui/screens/screens.dart';
import 'package:app/ui/style.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class NavScreen extends StatefulWidget {
  NavScreen({Key key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _currentIndex = 0;
  int _initIndex = 0;

  List<Widget> _screen = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_currentIndex],
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Color(KPrimaryColor),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CustomBottomNavigationBarItem(
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              title: 'Home',
              isActive: _currentIndex == 0 ? false : true,
              icon: EvaIcons.homeOutline,
            ),
            CustomBottomNavigationBarItem(
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
              title: 'favorite',
              isActive: _currentIndex == 1 ? false : true,
              icon: EvaIcons.heartOutline,
            ),
            CustomBottomNavigationBarItem(
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
              title: 'card',
              isActive: _currentIndex == 2 ? false : true,
              icon: EvaIcons.shoppingCartOutline,
            ),
            CustomBottomNavigationBarItem(
              onTap: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
              title: 'profile',
              isActive: _currentIndex == 3 ? false : true,
              icon: EvaIcons.personOutline,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBottomNavigationBarItem extends StatelessWidget {
  final Function onTap;
  final String title;
  final IconData icon;
  final bool isActive;
  const CustomBottomNavigationBarItem({
    Key key,
    @required this.onTap,
    @required this.title,
    @required this.icon,
    @required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            height: 10,
          ),
          isActive
              ? SizedBox.shrink()
              : Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange,
                  ),
                )
        ],
      ),
    );
  }
}
