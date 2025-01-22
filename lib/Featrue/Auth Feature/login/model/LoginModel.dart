class LoginModel {
  LoginModel({
    required this.data,
    required this.token,
  });
  late final Data data;
  late final String token;

  LoginModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['token'] = token;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.username,
    required this.email,
    required this.isOAuthUser,
    required this.role,
    required this.active,
  });
  late final String id;
  late final String username;
  late final String email;
  late final bool isOAuthUser;
  late final String role;
  late final bool active;


  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    isOAuthUser = json['isOAuthUser'];
    role = json['role'];
    active = json['active'];

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    _data['email'] = email;
    _data['isOAuthUser'] = isOAuthUser;
    _data['role'] = role;
    _data['active'] = active;
    return _data;
  }
}