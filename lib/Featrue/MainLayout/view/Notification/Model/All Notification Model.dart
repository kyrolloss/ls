class AllNotificationModel {
  AllNotificationModel({
    required this.results,
    required this.totalCount,
    required this.paginationResult,
    required this.data,
  });
  late final int results;
  late final int totalCount;
  late final PaginationResult paginationResult;
  late  List<Data> data;

  AllNotificationModel.fromJson(Map<String, dynamic> json){
    results = json['results'];
    totalCount = json['totalCount'];
    paginationResult = PaginationResult.fromJson(json['paginationResult']);
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['results'] = results;
    _data['totalCount'] = totalCount;
    _data['paginationResult'] = paginationResult.toJson();
    _data['data'] = data.map((e)=>e.toJson()).toList();
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

  PaginationResult.fromJson(Map<String, dynamic> json){
    currentPage = json['currentPage'];
    limit = json['limit'];
    numberOfPages = json['numberOfPages'];
    nextPage = json['nextPage'];
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
    required this.user,
    required this.message,
    required this.read,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String user;
  late final String message;
  late  bool read;
  late final String type;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    user = json['user'];
    message = json['message'];
    read = json['read'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['user'] = user;
    _data['message'] = message;
    _data['read'] = read;
    _data['type'] = type;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}