class ExerciseDetailsModel {
  ExerciseDetailsModel({
    required this.data,
  });
  late final Data data;

  ExerciseDetailsModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.bodyPart,
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
  late final BodyPart bodyPart;
  late final Null toolOrMachine;
  late final bool Cardio;
  late final bool Warmup;
  late final bool recoveryAndStretching;
  late final List<dynamic> deepAnatomy;
  late final Video video;
  late final Null Description;
  late final Null instructions;
  late final String createdAt;
  late final String updatedAt;
  late final String id;
  late final String title;
  late final String targetGender;

  Data.fromJson(Map<String, dynamic> json){
    bodyPart = BodyPart.fromJson(json['bodyPart']);
    toolOrMachine = null;
    Cardio = json['Cardio'];
    Warmup = json['Warmup'];
    recoveryAndStretching = json['recoveryAndStretching'];
    deepAnatomy = List.castFrom<dynamic, dynamic>(json['deepAnatomy']);
    video = Video.fromJson(json['video']);
    Description = null;
    instructions = null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['_id'];
    title = json['title'];
    targetGender = json['targetGender'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['bodyPart'] = bodyPart.toJson();
    _data['toolOrMachine'] = toolOrMachine;
    _data['Cardio'] = Cardio;
    _data['Warmup'] = Warmup;
    _data['recoveryAndStretching'] = recoveryAndStretching;
    _data['deepAnatomy'] = deepAnatomy;
    _data['video'] = video.toJson();
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
  late final String id;
  late final String title;

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

class Video {
  Video({
    required this.url,
    required this.publicId,
    required this.thumbnail,
  });
  late final String url;
  late final int publicId;
  late final String thumbnail;

  Video.fromJson(Map<String, dynamic> json){
    url = json['url'];
    publicId = json['public_id'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['public_id'] = publicId;
    _data['thumbnail'] = thumbnail;
    return _data;
  }
}