import 'package:flutter/material.dart';
import 'package:wallpaperapp/screen/home_page.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'PermanentMarker',
          primaryTextTheme: TextTheme(title: TextStyle(color: Colors.black)),
          iconTheme: IconThemeData(color: Colors.black)),
    ));
