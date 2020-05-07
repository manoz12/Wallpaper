import 'package:flutter/material.dart';
import 'package:wallpaperapp/util/global.dart';

class FullImage extends StatefulWidget {
  @override
  _FullImageState createState() => _FullImageState();
}

class _FullImageState extends State<FullImage> {
  PageController pageController = PageController(initialPage: Global.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: Global.photos.length,
        itemBuilder: (context, index) {
          return Hero(
            tag: '$index',
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          Global.photos[index].src.large2x,
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 90.0),
                      width: MediaQuery.of(context).size.width / 2,
                      height: 50,
                      color: Colors.blueGrey.shade800.withOpacity(0.6),
                      alignment: Alignment.center,
                      child: Text(
                        "Set Wallpaper",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
