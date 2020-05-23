import 'dart:math';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:file_utils/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_permissions/simple_permissions.dart';

import 'package:wallpaperapp/util/global.dart';

class FullImage extends StatefulWidget {
  final String imgPath;

  const FullImage({Key key, @required this.imgPath}) : super(key: key);

  @override
  _FullImageState createState() => _FullImageState();
}

class _FullImageState extends State<FullImage> {
  PageController pageController = PageController(initialPage: Global.index);
  bool downloading = false;
  var progress = "";
  Permission permission1 = Permission.WriteExternalStorage;
  static final Random random = Random();

  Future<void> downloadFile(String imgUrl) async {
    Dio dio = Dio();
    bool checkPermission1 =
        await SimplePermissions.checkPermission(permission1);
    if (checkPermission1 == false) {
      await SimplePermissions.requestPermission(permission1);
      checkPermission1 = await SimplePermissions.checkPermission(permission1);
    }
    if (checkPermission1 == true) {
      var dir = await getExternalStorageDirectory();
      var dirLoc = "${dir.path}/Wallpaper/";
      var randid = random.nextInt(10000);
      try {
        FileUtils.mkdir([dirLoc]);
        await dio.download(imgUrl, dirLoc + randid.toString() + ".jpg",
            onReceiveProgress: (receivedBytes, totalBytes) {
          setState(() {
            downloading = true;
            progress =
                ((receivedBytes / totalBytes) * 100).toStringAsFixed(0) + "%";
          });
        });
      } catch (e) {
        print(e);
      }
      setState(() {
        downloading = false;
        progress = " Download completed";
      });
    } else {
      setState(() {
        progress = "Permission Denied !";
      });
    }
  }

  final LinearGradient backgroundGradient = LinearGradient(
      colors: [Color(0x10000000), Color(0x30000000)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: downloading
            ? Container(
                decoration: BoxDecoration(gradient: backgroundGradient),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Hero(
                        tag: widget.imgPath,
                        child: FadeInImage(
                          image: NetworkImage(widget.imgPath),
                          fit: BoxFit.cover,
                          placeholder: AssetImage('wallfy.png'),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        color: Colors.black45,
                        width: double.infinity,
                        height: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Downloaded: $progress',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : PageView.builder(
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
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: FlatButton(
                            color: Colors.red,
                            onPressed: () {
                              downloadFile(widget.imgPath);
                            },
                            child: Text(
                              "Set Wallpaper",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }

  _save() async {
    var response = await Dio().get(widget.imgPath,
        options: Options(responseType: ResponseType.bytes));
    final results =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(results);
    Navigator.pop(context);
  }
}
