class ExercisesModel {
  ExercisesModel({
    required this.results,
    required this.totalCount,
    required this.paginationResult,
    required this.data,
  });
  late final int results;
  late final int totalCount;
  late final PaginationResult paginationResult;
  late final List<Data> data;

  ExercisesModel.fromJson(Map<String, dynamic> json){
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
     this.bodyPart,
    this.toolOrMachine,
    required this.Cardio,
    required this.Warmup,
    required this.recoveryAndStretching,
    required this.deepAnatomy,
    required this.video,
    this.Description,
    this.instructions,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.title,
    required this.targetGender,
  });
   BodyPart? bodyPart;
   ToolOrMachine? toolOrMachine;
   bool? Cardio;
   bool? Warmup;
   bool? recoveryAndStretching;
  late final List<DeepAnatomy> deepAnatomy;
   Video? video;
   String? Description;
   String? instructions;
  late final String createdAt;
  late final String updatedAt;
  late final String id;
  late final String title;
  late final String targetGender;

  Data.fromJson(Map<String, dynamic> json){
    if (json['bodyPart'] != null) {
      bodyPart = BodyPart.fromJson(json['bodyPart']);
    }
    if (json['toolOrMachine'] != null) {
      toolOrMachine = ToolOrMachine.fromJson(json['toolOrMachine']);
    }
    Cardio = json['Cardio'] ?? false;
    Warmup = json['Warmup'] ?? false; ;
    recoveryAndStretching = json['recoveryAndStretching'] ?? false;
    deepAnatomy = List.from(json['deepAnatomy']).map((e)=>DeepAnatomy.fromJson(e)).toList();
    video = Video.fromJson(json['video']);
    Description = json['Description'] ?? '';
    instructions = json['instructions'] ?? '';
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['_id'];
    title = json['title'];
    targetGender = json['targetGender'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['bodyPart'] = bodyPart?.toJson();
    _data['toolOrMachine'] = toolOrMachine;
    _data['Cardio'] = Cardio;
    _data['Warmup'] = Warmup;
    _data['recoveryAndStretching'] = recoveryAndStretching;
    _data['deepAnatomy'] = deepAnatomy.map((e)=>e.toJson()).toList();
    _data['video'] = video?.toJson();
    _data['Description'] = Description;
    _data['instructions'] = instructions;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['_id'] = id;
    _data['title'] = title;
    _data['targetGender'] = targetGender;
    return _data;
  }
}

class BodyPart {
  BodyPart({
    required this.id,
    required this.title,
  });
   String? id;
   String? title;

  BodyPart.fromJson(Map<String, dynamic> json){
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

class ToolOrMachine {
  ToolOrMachine({
    required this.id,
    required this.title,
  });
   String? id;
   String? title;

  ToolOrMachine.fromJson(Map<String, dynamic> json){
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

class DeepAnatomy {
  DeepAnatomy({
    required this.id,
    required this.title,
  });
   String? id;
   String? title;

  DeepAnatomy.fromJson(Map<String, dynamic> json){
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

class Video {
  Video({
    required this.url,
    required this.publicId,
    required this.thumbnail,
  });
   String? url;
   int? publicId;
   String? thumbnail;

  Video.fromJson(Map<String, dynamic> json){
    url = json['url'] ?? '';
    publicId = json['public_id'] ?? 0;
    thumbnail = json['thumbnail'] ??'';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['public_id'] = publicId;
    _data['thumbnail'] = thumbnail;
    return _data;
  }
}