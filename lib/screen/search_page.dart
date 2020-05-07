import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperapp/util/constant.dart';
import 'package:wallpaperapp/util/global.dart';

class SearchPage extends StatefulWidget {
  final String searchQuery;

  const SearchPage({Key key, this.searchQuery}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = new TextEditingController();

//  @override
//  void initState() {
//    getSearchWallpaper(widget.searchQuery);
//
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 36.0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30.0)),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          hintText: "search wallpaper",
                          border: InputBorder.none),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        // getSearchWallpaper(searchController.text);
                      },
                      child: Container(child: Icon(Icons.search))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
