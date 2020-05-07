//import 'dart:convert';
//
//import 'package:http/http.dart';
//import 'package:wallpaperapp/model/photo_model.dart';
//import 'package:wallpaperapp/util/constant.dart';
//
//Future<List<PhotoModel>> fetchImages() async {
//  final response = await get(apiurl, headers: {apiKey: apiKey});
//
//  if (response.statusCode == 200) {
//    return parseImage(response.body);
//  } else {
//    throw 'Failed to fetch images : ${response.body}';
//  }
//}
//
//List<PhotoModel> parseImage(String body) {
//  final responseJson = json.decode(body) as Map<String, dynamic>;
//  final imageJson = responseJson["photos"] as List;
//  return imageJson
//      .cast<Map<String, dynamic>>()
//      .map((image) => PhotoModel.fromMap(image))
//      .toList();
//}
