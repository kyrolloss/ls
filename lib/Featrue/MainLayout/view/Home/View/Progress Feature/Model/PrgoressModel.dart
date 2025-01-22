class ProgressModel {
  ProgressModel({
    required this.results,
    required this.totalCount,
    required this.paginationResult,
    required this.data,
  });
  late final int results;
  late final int totalCount;
  late final PaginationResult paginationResult;
  late final List<Data> data;

  ProgressModel.fromJson(Map<String, dynamic> json){
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
     this.currentPage,
     this.limit,
     this.numberOfPages,
  });
  int? currentPage;
  int? limit;
  int? numberOfPages;

  PaginationResult.fromJson(Map<String, dynamic> json){
    currentPage = json['currentPage'];
    limit = json['limit'];
    numberOfPages = json['numberOfPages'];
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
    required this.userId,
    required this.volumes,
    required this.createdAt,
    required this.updatedAt,
    required this.exercise,
  });
  late final String id;
  late final UserId userId;
  late final List<Volumes> volumes;
  late final String createdAt;
  late final String updatedAt;
  late final Exercise exercise;

  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    userId = UserId.fromJson(json['userId']);
    volumes = List.from(json['volumes']).map((e)=>Volumes.fromJson(e)).toList();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    exercise = Exercise.fromJson(json['exercise']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['userId'] = userId.toJson();
    _data['volumes'] = volumes.map((e)=>e.toJson()).toList();
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['exercise'] = exercise.toJson();
    return _data;
  }
}

class UserId {
  UserId({
    required this.id,
    required this.username,
  });
  late final String id;
  late final String username;

  UserId.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    return _data;
  }
}

class Volumes {
  Volumes({
    required this.volume,
    required this.date,
    required this.id,
  });
  late final int volume;
  late final String date;
  late final String id;

  Volumes.fromJson(Map<String, dynamic> json){
    volume = json['volume'];
    date = json['date'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['volume'] = volume;
    _data['date'] = date;
    _data['_id'] = id;
    return _data;
  }
}

class Exercise {
  Exercise({
    required this.id,
    required this.title,
  });
  late final String id;
  late final String title;

  Exercise.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    return _data;
  }
}