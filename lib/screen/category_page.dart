import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperapp/data/categories_data.dart';
import 'package:wallpaperapp/model/categories_model.dart';
import 'package:wallpaperapp/ui/categories_image.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<CategoriesModel> categories = new List();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    categories = getCategories();
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
              "Catagories",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (builder, index) {
              return CategoryTile(
                  imgUrl: categories[index].categoriesImageUrl,
                  title: categories[index].categoriesName);
            }));
  }
}

class CategoryTile extends StatelessWidget {
  final String title, imgUrl;

  const CategoryTile({Key key, this.title, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryScreen(
                      categories: title,
                    )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.0)),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
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
      ),
    );
  }
}
