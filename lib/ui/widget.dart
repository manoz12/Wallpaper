import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget searchBar() {
  return Container(
    color: Colors.grey.shade400,
    child: Row(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
              hintText: "search wallpaper", border: InputBorder.none),
        ),
        Icon(Icons.search),
      ],
    ),
  );
}

class CategoryTile extends StatelessWidget {
  final String title, imgUrl;

  const CategoryTile({Key key, this.title, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.0)),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(24.0),
            child: Image.network(
              imgUrl,
              width: MediaQuery.of(context).size.width,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(24.0),
            ),
            width: MediaQuery.of(context).size.width,
            height: 180,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
