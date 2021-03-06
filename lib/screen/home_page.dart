import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperapp/screen/about.dart';
import 'package:wallpaperapp/screen/category_page.dart';
import 'package:wallpaperapp/screen/trending_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentNavIndex = 0;
  static List<Widget> _navBarListIcon = <Widget>[
    Icon(Icons.wallpaper),
    Icon(Icons.category),
    Icon(Icons.file_download),
    Icon(Icons.settings)
  ];
  final List<Widget> _children = [
    TrendingPage(),
    CategoryPage(),
    Container(color: Colors.black),
    About()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children.elementAt(_currentNavIndex),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black26,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.white,
        height: 50,
        items: _navBarListIcon,
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
        onTap: _onItemTappedForNavBar,
      ),
    );
  }

  void _onItemTappedForNavBar(int index) {
    setState(() {
      _currentNavIndex = index;
//
    });
  }
}
