class SpecificLesson {
  Data? data;

  SpecificLesson({this.data});

  SpecificLesson.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Video? video;
  String? sId;
  String? title;
  Course? course;
  String? type;
  String? image;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.video,
        this.sId,
        this.title,
        this.course,
        this.type,
        this.image,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    video = json['video'] != null ? new Video.fromJson(json['video']) : null;
    sId = json['_id'];
    title = json['title'];
    course =
    json['course'] != null ? new Course.fromJson(json['course']) : null;
    type = json['type'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.video != null) {
      data['video'] = this.video!.toJson();
    }
    data['_id'] = this.sId;
    data['title'] = this.title;
    if (this.course != null) {
      data['course'] = this.course!.toJson();
    }
    data['type'] = this.type;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Video {
  String? url;
  int? publicId;
  String? thumbnail;

  Video({this.url, this.publicId, this.thumbnail});

  Video.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    publicId = json['public_id'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['public_id'] = this.publicId;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class Course {
  String? sId;
  String? title;

  Course({this.sId, this.title});

  Course.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    return data;
  }
}
