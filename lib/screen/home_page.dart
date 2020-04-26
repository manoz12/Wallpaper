import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _kTabs = <Tab>[
    Tab(
      text: 'Categories',
    ),
    Tab(text: 'Recents')
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "WallPaper",
          ),
          bottom: TabBar(
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0), color: Colors.white),
            indicatorColor: Colors.white,
            tabs: _kTabs,
            unselectedLabelColor: Colors.black,
            labelColor: Colors.black,
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.black26,
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.white,
          height: 50,
          items: <Widget>[
            Icon(Icons.wallpaper),
            Icon(Icons.category),
            Icon(Icons.file_download),
            Icon(Icons.settings)
          ],
          animationDuration: Duration(milliseconds: 200),
          animationCurve: Curves.bounceInOut,
          onTap: (index) {},
        ),
      ),
    );
  }
}
