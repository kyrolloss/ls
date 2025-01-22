class FoodCalculatorFilterModel {
  FoodCalculatorFilterModel({
    required this.results,
    required this.totalCount,
    required this.paginationResult,
    required this.data,
  });
  late final int results;
  late final int totalCount;
  late final PaginationResult paginationResult;
  late final List<Data> data;

  FoodCalculatorFilterModel.fromJson(Map<String, dynamic> json) {
    results = (json['results'] as num?)?.toInt() ?? 0; // Safely handle null values
    totalCount = (json['totalCount'] as num?)?.toInt() ?? 0;
    paginationResult = PaginationResult.fromJson(json['paginationResult'] ?? {});
    data = (json['data'] as List<dynamic>?)
        ?.map((e) => Data.fromJson(e))
        .toList() ??
        [];
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
  });
  late final int currentPage;
  late final int limit;
  late final int numberOfPages;

  PaginationResult.fromJson(Map<String, dynamic> json) {
    currentPage = (json['currentPage'] as num?)?.toInt() ?? 0; // Default to 0 if null
    limit = (json['limit'] as num?)?.toInt() ?? 0;
    numberOfPages = (json['numberOfPages'] as num?)?.toInt() ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['currentPage'] = currentPage;
    _data['limit'] = limit;
    _data['numberOfPages'] = numberOfPages;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.TitleAR,
    required this.TitleEN,
  });
  late final String id;
  late final String TitleAR;
  late final String TitleEN;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? ''; // Default to empty string if null
    TitleAR = json['Title_AR'] ?? '';
    TitleEN = json['Title_EN'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['Title_AR'] = TitleAR;
    _data['Title_EN'] = TitleEN;
    return _data;
  }
}
