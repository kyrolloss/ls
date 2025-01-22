class SpecificChatMessages {
  int? results;
  int? totalCount;
  PaginationResult? paginationResult;
  List<Chats>? chats;

  SpecificChatMessages(
      {this.results, this.totalCount, this.paginationResult, this.chats});

  SpecificChatMessages.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    totalCount = json['totalCount'];
    paginationResult = json['paginationResult'] != null
        ? new PaginationResult.fromJson(json['paginationResult'])
        : null;
    if (json['data'] != null) {
      chats = <Chats>[];
      json['data'].forEach((v) {
        chats!.add(new Chats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = this.results;
    data['totalCount'] = this.totalCount;
    if (this.paginationResult != null) {
      data['paginationResult'] = this.paginationResult!.toJson();
    }
    if (this.chats != null) {
      data['data'] = this.chats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaginationResult {
  int? currentPage;
  int? limit;
  int? numberOfPages;

  PaginationResult({this.currentPage, this.limit, this.numberOfPages});

  PaginationResult.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    limit = json['limit'];
    numberOfPages = json['numberOfPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['limit'] = this.limit;
    data['numberOfPages'] = this.numberOfPages;
    return data;
  }
}

class Chats {
  String? id;
  String? chat;
  Sender? sender;
  String? text;
  RepliedTo? repliedTo;
  List<Media>? media;
  List<Reactions>? reactions;
  String? createdAt;
  String? updatedAt;
  bool? isRead;

  Chats(
      {this.id,
        this.chat,
        this.sender,
        this.text,
        this.repliedTo,
        this.media,
        this.reactions,
        this.createdAt,
        this.updatedAt , this.isRead = true});

  Chats.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    chat = json['chat'];
    sender =
    json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    text = json['text'];

    repliedTo = json['repliedTo'] != null
        ? new RepliedTo.fromJson(json['repliedTo'])
        : null;
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
    if (json['reactions'] != null) {
      reactions = <Reactions>[];
      json['reactions'].forEach((v) {
        reactions!.add(new Reactions.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['chat'] = this.chat;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    data['text'] = this.text;


    if (this.repliedTo != null) {
      data['repliedTo'] = this.repliedTo!.toJson();
    }
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    if (this.reactions != null) {
      data['reactions'] = this.reactions!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Sender {
  String? id;
  String? username;
  String? profileImg;

  Sender({this.id, this.username, this.profileImg});

  Sender.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    profileImg = json['profileImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['username'] = this.username;
    data['profileImg'] = this.profileImg;
    return data;
  }
}

class RepliedTo {
  String? Id;
  Sender? sender;
  String? text;
  List<Media>? media;

  RepliedTo({this.Id, this.sender, this.text, this.media});

  RepliedTo.fromJson(Map<String, dynamic> json) {
    Id = json['_id'];
    sender =
    json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    text = json['text'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.Id;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    data['text'] = this.text;
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Media {
  String? url;
  String? type;

  Media({this.url, this.type});

  Media.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['type'] = this.type;
    return data;
  }
}

class Reactions {
  User? user;
  String? emoji;
  String? id;

  Reactions({this.user, this.emoji, this.id});

  Reactions.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    emoji = json['emoji'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['emoji'] = this.emoji;
    data['_id'] = this.id;
    return data;
  }
}

class User {
  String? sId;
  String? username;

  User({this.sId, this.username});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    return data;
  }
}
