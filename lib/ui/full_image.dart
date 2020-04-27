import 'package:flutter/material.dart';
import 'package:wallpaperapp/util/global.dart';

class FullImage extends StatefulWidget {
  @override
  _FullImageState createState() => _FullImageState();
}

class _FullImageState extends State<FullImage> {
  PageController _pageController =
      new PageController(initialPage: Global.Index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: _pageController,
          itemCount: Global.photos.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        Global.photos[index].src.large2x,
                      ),
                      fit: BoxFit.cover)),
            );
          }),
    );
  }
}
