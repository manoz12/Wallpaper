import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperapp/model/photo_model.dart';
import 'package:wallpaperapp/ui/full_image.dart';
import 'package:wallpaperapp/util/constant.dart';
import 'package:wallpaperapp/util/global.dart';

class TrendingPage extends StatefulWidget {
  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  Future getWallpaper() async {
    await http.get(apiurl, headers: {apiKey: apiValue}).then((response) {
      var parsedJson = jsonDecode(response.body);
      Global.photos = (parsedJson["photos"] as List)
          .map((data) => Photos.fromJson(data))
          .toList();
    });
    setState(() {});
  }

//
  @override
  void initState() {
    super.initState();
    getWallpaper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: Global.photos.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Global.Index = index;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FullImage()));
              },
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3.0),
                    image: DecorationImage(
                        image: NetworkImage(Global.photos[index].src.portrait),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
