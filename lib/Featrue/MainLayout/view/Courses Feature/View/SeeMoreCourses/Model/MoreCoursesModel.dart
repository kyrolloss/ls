class SeeMoreCoursesModel {
  SeeMoreCoursesModel({
    required this.results,
    required this.totalCount,
    required this.paginationResult,
    required this.data,
  });
  late final int results;
  late final int totalCount;
  late final PaginationResult paginationResult;
  late final List<Data> data;

  SeeMoreCoursesModel.fromJson(Map<String, dynamic> json) {
    results = json['results'] ?? 0;
    totalCount = json['totalCount'] ?? 0;
    paginationResult = json['paginationResult'] != null
        ? PaginationResult.fromJson(json['paginationResult'])
        : PaginationResult(
      currentPage: 0,
      limit: 0,
      numberOfPages: 0,
      nextPage: 0,
    );
    data = (json['data'] as List<dynamic>? ?? [])
        .map((e) => Data.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['results'] = results;
    _data['totalCount'] = totalCount;
    _data['paginationResult'] = paginationResult.toJson();
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class PaginationResult {
  PaginationResult({
    required this.currentPage,
    required this.limit,
    required this.numberOfPages,
    required this.nextPage,
  });
  late final int currentPage;
  late final int limit;
  late final int numberOfPages;
  late final int nextPage;

  PaginationResult.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'] ?? 0;
    limit = json['limit'] ?? 0;
    numberOfPages = json['numberOfPages'] ?? 0;
    nextPage = json['nextPage'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['currentPage'] = currentPage;
    _data['limit'] = limit;
    _data['numberOfPages'] = numberOfPages;
    _data['nextPage'] = nextPage;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.users,
    required this.price,
    required this.category,
    required this.priceAfterDiscount,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String title;
  late final String description;
  late final String image;
  late final List<String> users;
  late final int price;
  late final Category category;
  late final int priceAfterDiscount;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    title = json['title'] ?? '';
    description = json['description'] ?? '';
    image = json['image'] ?? '';
    users = List<String>.from(json['users'] ?? []);
    price = json['price'] ?? 0;
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : Category(id: '', title: '');
    priceAfterDiscount = json['priceAfterDiscount'] ?? 0;
    createdAt = json['createdAt'] ?? '';
    updatedAt = json['updatedAt'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['image'] = image;
    _data['users'] = users;
    _data['price'] = price;
    _data['category'] = category.toJson();
    _data['priceAfterDiscount'] = priceAfterDiscount;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}

class Category {
  Category({
    required this.id,
    required this.title,
  });
  late final String id;
  late final String title;

  Category.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    title = json['title'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    return _data;
  }
}
