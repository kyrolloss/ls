class BodyPartsModel {
  BodyPartsModel({
    required this.results,
    required this.totalCount,
    required this.paginationResult,
    required this.data,
  });
  late final int results;
  late final int totalCount;
  late final PaginationResult paginationResult;
  late final List<Data> data;

  BodyPartsModel.fromJson(Map<String, dynamic> json) {
    results = json['results'] ?? 0; // Default to 0 if null
    totalCount = json['totalCount'] ?? 0; // Default to 0 if null
    paginationResult = json['paginationResult'] != null
        ? PaginationResult.fromJson(json['paginationResult'])
        : PaginationResult(currentPage: 0, limit: 0, numberOfPages: 0); // Default paginationResult
    data = json['data'] != null
        ? List.from(json['data']).map((e) => Data.fromJson(e)).toList()
        : []; // Default to an empty list if null
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
    currentPage = json['currentPage'] ?? 0; // Default to 0 if null
    limit = json['limit'] ?? 0; // Default to 0 if null
    numberOfPages = json['numberOfPages'] ?? 0; // Default to 0 if null
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
    required this.title,
  });
  late final String id;
  late final String title;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? ''; // Default to an empty string if null
    title = json['title'] ?? ''; // Default to an empty string if null
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    return _data;
  }
}
