import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperapp/model/photo_model.dart';
import 'package:wallpaperapp/ui/full_image.dart';
import 'package:wallpaperapp/util/constant.dart';
import 'package:wallpaperapp/util/global.dart';

class SearchBarTool extends StatefulWidget {
  final search;

  const SearchBarTool({Key key, this.search}) : super(key: key);

  @override
  _SearchBarToolState createState() => _SearchBarToolState();
}

class _SearchBarToolState extends State<SearchBarTool> {
  TextEditingController _searchController = new TextEditingController();

  getSearchWallpaper(String searchQuery) async {
    await http.get(
        "https://api.pexels.com/v1/search?query=$searchQuery&per_page=30&page=1",
        headers: {apiKey: apiValue}).then((res) {
      var parsedJson = jsonDecode(res.body);
      Global.photos = (parsedJson["photos"] as List)
          .map((data) => Photos.fromJson(data))
          .toList();
    });

    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    getSearchWallpaper(widget.search);
    _searchController.text = widget.search;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 40.0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(20.0)),
              margin: EdgeInsets.symmetric(horizontal: 24),
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                        hintText: "search wallpapers",
                        border: InputBorder.none),
                  )),
                  InkWell(
                      onTap: () {
                        getSearchWallpaper(_searchController.text);
                      },
                      child: Container(child: Icon(Icons.search)))
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(4.0),
                  mainAxisSpacing: 6.0,
                  crossAxisSpacing: 6.0,
                  children: Global.photos.map((Photos photoModel) {
                    return GridTile(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FullImage()));
                      },
                      child: Hero(
                        tag: photoModel.src.portrait,
                        child: Container(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: kIsWeb
                                  ? Image.network(
                                      photoModel.src.portrait,
                                      height: 50,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    )
                                  : CachedNetworkImage(
                                      imageUrl: photoModel.src.portrait,
                                      placeholder: (context, url) => Container(
                                            color: Color(0xfff5f8fd),
                                          ),
                                      fit: BoxFit.cover)),
                        ),
                      ),
                    ));
                  }).toList()),
            ),
          ],
        ),
      ),
    ));
//
  }
}
