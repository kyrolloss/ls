class SpecificSupplement {
  SpecificSupplement({
    required this.data,
  });
  late final Data data;

  SpecificSupplement.fromJson(Map<String, dynamic> json){
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
    required this.video,
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });
  late final Video video;
  late final String id;
  late final String title;
  late final String description;
  late final String image;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    video = Video.fromJson(json['video']);
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['video'] = video.toJson();
    _data['_id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['image'] = image;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
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