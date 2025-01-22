class SpecificCourseLessonModel {
  SpecificCourseLessonModel({
    this.results,
    this.totalCount,
    this.paginationResult,
    this.data,
  });
  int? results;
  int? totalCount;
  PaginationResult? paginationResult;
  List<Data>? data;

  SpecificCourseLessonModel.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    totalCount = json['totalCount'];
    paginationResult = json['paginationResult'] != null
        ? PaginationResult.fromJson(json['paginationResult'])
        : null;
    data = json['data'] != null
        ? List.from(json['data']).map((e) => Data.fromJson(e)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    if (results != null) _data['results'] = results;
    if (totalCount != null) _data['totalCount'] = totalCount;
    if (paginationResult != null) {
      _data['paginationResult'] = paginationResult!.toJson();
    }
    if (data != null) {
      _data['data'] = data!.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class PaginationResult {
  PaginationResult({
    this.currentPage,
    this.limit,
    this.numberOfPages,
  });
  int? currentPage;
  int? limit;
  int? numberOfPages;

  PaginationResult.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    limit = json['limit'];
    numberOfPages = json['numberOfPages'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    if (currentPage != null) _data['currentPage'] = currentPage;
    if (limit != null) _data['limit'] = limit;
    if (numberOfPages != null) _data['numberOfPages'] = numberOfPages;
    return _data;
  }
}

class Data {
  Data({
    this.video,
    this.id,
    this.title,
    this.course,
    this.type,
    this.createdAt,
    this.updatedAt,
  });
  Video? video;
  String? id;
  String? title;
  Course? course;
  String? type;
  String? createdAt;
  String? updatedAt;

  Data.fromJson(Map<String, dynamic> json) {
    video = json['video'] != null ? Video.fromJson(json['video']) : null;
    id = json['_id'];
    title = json['title'];
    course = json['course'] != null ? Course.fromJson(json['course']) : null;
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    if (video != null) _data['video'] = video!.toJson();
    if (id != null) _data['_id'] = id;
    if (title != null) _data['title'] = title;
    if (course != null) _data['course'] = course!.toJson();
    if (type != null) _data['type'] = type;
    if (createdAt != null) _data['createdAt'] = createdAt;
    if (updatedAt != null) _data['updatedAt'] = updatedAt;
    return _data;
  }
}

class Video {
  Video({
    this.url,
    this.publicId,
    this.thumbnail,
  });
  String? url;
  int? publicId;
  String? thumbnail;

  Video.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    publicId = json['public_id'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    if (url != null) _data['url'] = url;
    if (publicId != null) _data['public_id'] = publicId;
    if (thumbnail != null) _data['thumbnail'] = thumbnail;
    return _data;
  }
}

class Course {
  Course({
    this.id,
    this.title,
    this.category,
  });
  String? id;
  String? title;
  Category? category;

  Course.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    if (id != null) _data['_id'] = id;
    if (title != null) _data['title'] = title;
    if (category != null) _data['category'] = category!.toJson();
    return _data;
  }
}

class Category {
  Category({
    this.id,
    this.title,
  });
  String? id;
  String? title;

  Category.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    if (id != null) _data['_id'] = id;
    if (title != null) _data['title'] = title;
    return _data;
  }
}
