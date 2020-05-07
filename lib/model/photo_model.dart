//class PhotoModel {
//  String photographer;
//  String photographer_url;
//  int photographer_id;
//  SrcModel src;
//  PhotoModel(
//      {this.src,
//      this.photographer,
//      this.photographer_id,
//      this.photographer_url});
//
//  factory PhotoModel.fromMap(Map<String, dynamic> jsonData) {
//    return PhotoModel(
//        src: SrcModel.fromMap(jsonData["src"]),
//        photographer_url: jsonData["photographer_url"],
//        photographer_id: jsonData["photographer_id"],
//        photographer: jsonData["photographer"]);
//  }
//}
//
//class SrcModel {
//  String original;
//  String small;
//  String portrait;
//  String large2x;
//  String large;
//  String medium;
//
//  SrcModel(
//      {this.portrait,
//      this.medium,
//      this.large,
//      this.large2x,
//      this.original,
//      this.small});
//
//  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
//    return SrcModel(
//        portrait: jsonData["portrait"],
//        medium: jsonData["medium"],
//        large2x: jsonData["large2x"],
//        original: jsonData["original"],
//        small: jsonData["small"],
//        large: jsonData["large"]);
//  }
//}
class PhotoModel {
  int totalResults;
  int page;
  int perPage;
  List<Photos> photos;
  String nextPage;

  PhotoModel(
      {this.totalResults, this.page, this.perPage, this.photos, this.nextPage});

  PhotoModel.fromJson(Map<String, dynamic> json) {
    totalResults = json['total_results'];
    page = json['page'];
    perPage = json['per_page'];
    if (json['photos'] != null) {
      photos = new List<Photos>();
      json['photos'].forEach((v) {
        photos.add(new Photos.fromJson(v));
      });
    }
    nextPage = json['next_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_results'] = this.totalResults;
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    data['next_page'] = this.nextPage;
    return data;
  }
}

class Photos {
  int id;
  int width;
  int height;
  String url;
  String photographer;
  String photographerUrl;
  int photographerId;
  Src src;
  bool liked;

  Photos(
      {this.id,
      this.width,
      this.height,
      this.url,
      this.photographer,
      this.photographerUrl,
      this.photographerId,
      this.src,
      this.liked});

  Photos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
    photographer = json['photographer'];
    photographerUrl = json['photographer_url'];
    photographerId = json['photographer_id'];
    src = json['src'] != null ? new Src.fromJson(json['src']) : null;
    liked = json['liked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['width'] = this.width;
    data['height'] = this.height;
    data['url'] = this.url;
    data['photographer'] = this.photographer;
    data['photographer_url'] = this.photographerUrl;
    data['photographer_id'] = this.photographerId;
    if (this.src != null) {
      data['src'] = this.src.toJson();
    }
    data['liked'] = this.liked;
    return data;
  }
}

class Src {
  String original;
  String large2x;
  String large;
  String medium;
  String small;
  String portrait;
  String landscape;
  String tiny;

  Src(
      {this.original,
      this.large2x,
      this.large,
      this.medium,
      this.small,
      this.portrait,
      this.landscape,
      this.tiny});

  Src.fromJson(Map<String, dynamic> json) {
    original = json['original'];
    large2x = json['large2x'];
    large = json['large'];
    medium = json['medium'];
    small = json['small'];
    portrait = json['portrait'];
    landscape = json['landscape'];
    tiny = json['tiny'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original'] = this.original;
    data['large2x'] = this.large2x;
    data['large'] = this.large;
    data['medium'] = this.medium;
    data['small'] = this.small;
    data['portrait'] = this.portrait;
    data['landscape'] = this.landscape;
    data['tiny'] = this.tiny;
    return data;
  }
}
