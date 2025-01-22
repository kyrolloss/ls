
class CoursesCategoriesModel {
  int? results;
  int? totalCount;
  PaginationResult? paginationResult;
  List<Data>? data;

  CoursesCategoriesModel({this.results, this.totalCount, this.paginationResult, this.data});

  CoursesCategoriesModel.fromJson(Map<String, dynamic> json) {
    results = json["results"];
    totalCount = json["totalCount"];
    paginationResult = json["paginationResult"] == null ? null : PaginationResult.fromJson(json["paginationResult"]);
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["results"] = results;
    _data["totalCount"] = totalCount;
    if(paginationResult != null) {
      _data["paginationResult"] = paginationResult?.toJson();
    }
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  String? id;
  String? title;
  String? createdAt;
  String? updatedAt;
  List<Courses>? courses;


  Data({this.id, this.title, this.createdAt, this.updatedAt, this.courses, });

  Data.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    title = json["title"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    courses = json["courses"] == null ? null : (json["courses"] as List).map((e) => Courses.fromJson(e)).toList();
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["title"] = title;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    if(courses != null) {
      _data["courses"] = courses?.map((e) => e.toJson()).toList();
    }
    _data["id"] = id;
    return _data;
  }
}

class Courses {
  String? id;
  String? title;
  String? description;
  String? image;
  int? price;
  int? priceAfterDiscount;
  List? users;

  Courses({this.id, this.title, this.description, this.image, this.price, this.priceAfterDiscount , this.users});

  Courses.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    title = json["title"];
    description = json["description"];
    image = json["image"];
    price = json["price"];
    priceAfterDiscount = json["priceAfterDiscount"];
    users = json["users"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["title"] = title;
    _data["description"] = description;
    _data["image"] = image;
    _data["price"] = price;
    _data["priceAfterDiscount"] = priceAfterDiscount;
    _data["users"] = users;
    return _data;
  }
}

class PaginationResult {
  int? currentPage;
  int? limit;
  int? numberOfPages;

  PaginationResult({this.currentPage, this.limit, this.numberOfPages});

  PaginationResult.fromJson(Map<String, dynamic> json) {
    currentPage = json["currentPage"];
    limit = json["limit"];
    numberOfPages = json["numberOfPages"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["currentPage"] = currentPage;
    _data["limit"] = limit;
    _data["numberOfPages"] = numberOfPages;
    return _data;
  }
}