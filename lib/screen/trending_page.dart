import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperapp/model/photo_model.dart';
import 'package:wallpaperapp/ui/full_image.dart';
import 'package:wallpaperapp/ui/search_bar.dart';
import 'package:wallpaperapp/util/constant.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperapp/util/global.dart';

class TrendingPage extends StatefulWidget {
  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  getWallpaper() async {
    await http.get(apiurl, headers: {apiKey: apiValue}).then((res) {
      // print(res.body);
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
    // TODO: implement initState
    super.initState();
    getWallpaper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Trending",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchBarTool()));
                }),
          )
        ],
      ),
      body: _buildGridView(),
    );
  }
}

_buildGridView() {
  return GridView.builder(
    itemCount: Global.photos.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 0.6),
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          Global.index = index;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FullImage()));
        },
        child: Hero(
          tag: '$index',
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: kIsWeb
                  ? Image.network(
                      Global.photos[index].src.portrait,
                      fit: BoxFit.cover,
                    )
                  : CachedNetworkImage(
                      imageUrl: Global.photos[index].src.portrait,
                      placeholder: (context, url) => Container(
                        color: Color(0xfff5f8fd),
                      ),
                      fit: BoxFit.cover,
                    ),
            ),
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.all(Radius.circular(10)),
//              image: DecorationImage(
//                image: CachedNetworkImage(
//                  imageUrl: Global.photos[index].src.portrait,
//                ),
//                fit: BoxFit.cover,
//              ),
//            ),
          ),
        ),
      );
    },
  );
}
