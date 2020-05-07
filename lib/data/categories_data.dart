import 'package:wallpaperapp/model/categories_model.dart';

List<CategoriesModel> getCategories() {
  List<CategoriesModel> categories = new List();
  CategoriesModel categoriesModel = new CategoriesModel();
  categoriesModel.categoriesImageUrl =
      "https://images.pexels.com/photos/2605200/pexels-photo-2605200.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260";
  categoriesModel.categoriesName = "Street Art";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //
  categoriesModel.categoriesImageUrl =
      "https://images.pexels.com/photos/459124/pexels-photo-459124.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260";
  categoriesModel.categoriesName = "Wild Life";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //
  categoriesModel.categoriesImageUrl =
      "https://images.pexels.com/photos/210186/pexels-photo-210186.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName = "Nature";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //
  categoriesModel.categoriesImageUrl =
      "https://images.pexels.com/photos/169647/pexels-photo-169647.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName = "City";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //
  categoriesModel.categoriesImageUrl =
      "https://images.pexels.com/photos/2228585/pexels-photo-2228585.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName = "Motivation";

  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //
  categoriesModel.categoriesImageUrl =
      "https://images.pexels.com/photos/104842/bmw-vehicle-ride-bike-104842.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName = "Bikes";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //
  categoriesModel.categoriesImageUrl =
      "https://images.pexels.com/photos/3802510/pexels-photo-3802510.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName = "Cars";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  return categories;
}
