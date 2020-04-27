import 'package:flutter/material.dart';
import 'package:wallpaperapp/data/categories_data.dart';
import 'package:wallpaperapp/model/categories_model.dart';
import 'package:wallpaperapp/ui/widget.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<CategoriesModel> categories = new List();
  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (builder, index) {
          return CategoryTile(
            title: categories[index].categoriesName,
            imgUrl: categories[index].categoriesImageUrl,
          );
        });
  }
}
