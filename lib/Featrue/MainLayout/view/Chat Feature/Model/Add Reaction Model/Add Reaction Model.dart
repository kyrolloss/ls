import '../Spicific Chat Messages/Spicific Chat Messages.dart';

class AddReactionModel {
  AddReactionModel({
    required this.data,
  });
  late final Data data;

  AddReactionModel.fromJson(Map<String, dynamic> json){
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
    required this.id,
    required this.chat,
    required this.sender,
    required this.text,
    required this.media,
    required this.isRead,
    required this.seendBy,
    required this.reactions,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String id;
  late final String chat;
  late final TheSender sender;
  late final String text;
  late final List<dynamic> media;
  late final bool isRead;
  late final List<dynamic> seendBy;
  late final List<Reactions> reactions;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    chat = json['chat'];
    sender = TheSender.fromJson(json['sender']);
    text = json['text'];
    media = List.castFrom<dynamic, dynamic>(json['media']);
    isRead = json['isRead'];
    seendBy = List.castFrom<dynamic, dynamic>(json['seendBy']);
    reactions = List.from(json['reactions']).map((e)=>Reactions.fromJson(e)).toList();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['chat'] = chat;
    _data['sender'] = sender.toJson();
    _data['text'] = text;
    _data['media'] = media;
    _data['isRead'] = isRead;
    _data['seendBy'] = seendBy;
    _data['reactions'] = reactions.map((e)=>e.toJson()).toList();
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}

class TheSender {
  TheSender({
    required this.id,
    required this.username,
    this.profileImg,
  });
  late final String id;
  late final String username;
  late final Null profileImg;

  TheSender.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    username = json['username'];
    profileImg = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    _data['profileImg'] = profileImg;
    return _data;
  }
}



