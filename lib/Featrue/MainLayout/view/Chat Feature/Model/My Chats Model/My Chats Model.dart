class MyChatsModel {
  MyChatsModel({
    required this.status,
    required this.results,
    required this.data,
  });
  late final String status;
  late final int results;
  late final List<Data> data;

  MyChatsModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    results = json['results'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['results'] = results;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.participants,
    required this.archived,
    required this.lastMessage,
    this.image,
    required this.isGroup,

  });
  late final String id;
  late final List<Participants> participants;
  late final bool archived;
   List<LastMessage>? lastMessage;
   String? image;
   late final bool isGroup;

  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    participants = List.from(json['participants']).map((e)=>Participants.fromJson(e)).toList();
    archived = json['archived'];
    lastMessage = List.from(json['lastMessage']).map((e)=>LastMessage.fromJson(e)).toList();
    image = json['image'];
    isGroup = json['isGroupChat'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['participants'] = participants.map((e)=>e.toJson()).toList();
    _data['archived'] = archived;
    _data['lastMessage'] = lastMessage?.map((e)=>e.toJson()).toList();
    _data['image'] = image;
    _data['isGroupChat'] = isGroup;
    return _data;
  }
}

class Participants {
  Participants({
    required this.isAdmin,
    required this.userDetails,
  });
  late final bool isAdmin;
  late final UserDetails userDetails;

  Participants.fromJson(Map<String, dynamic> json){
    isAdmin = json['isAdmin'];
    userDetails = UserDetails.fromJson(json['userDetails']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isAdmin'] = isAdmin;
    _data['userDetails'] = userDetails.toJson();
    return _data;
  }
}

class UserDetails {
  UserDetails({
    required this.id,
    required this.username,
    this.profileImg,
  });
  late final String id;
  late final String username;
  String? profileImg;

  UserDetails.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    username = json['username'];
    profileImg = json['profileImg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    _data['profileImg'] = profileImg;
    return _data;
  }
}

class LastMessage {
  LastMessage({
    required this.id,
    required this.text,
    required this.media,
    required this.createdAt,
    required this.senderDetails,
  });
  late final String id;
  late final String text;
  late final List<dynamic> media;
  late final String createdAt;
  late final SenderDetails senderDetails;

  LastMessage.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    text = json['text'];
    media = List.castFrom<dynamic, dynamic>(json['media']);
    createdAt = json['createdAt'];
    senderDetails = SenderDetails.fromJson(json['senderDetails']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['text'] = text;
    _data['media'] = media;
    _data['createdAt'] = createdAt;
    _data['senderDetails'] = senderDetails.toJson();
    return _data;
  }
}

class SenderDetails {
  SenderDetails({
    required this.id,
    required this.username,
  });
  late final String id;
  late final String username;

  SenderDetails.fromJson(Map<String, dynamic> json){
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