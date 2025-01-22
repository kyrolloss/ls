class RegisterModel {
  RegisterModel({
    required this.data,
    required this.token,
  });
  late final Data data;
  late final String token;

  RegisterModel.fromJson(Map<String, dynamic> json){
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
    required this.username,
    required this.email,
    required this.phone,
    required this.isOAuthUser,
    required this.role,
    required this.active,
    required this.id,
  });
  late final String username;
  late final String email;
  late final String phone;
  late final bool isOAuthUser;
  late final String role;
  late final bool active;
  late final String id;

  Data.fromJson(Map<String, dynamic> json){
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    isOAuthUser = json['isOAuthUser'];
    role = json['role'];
    active = json['active'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['isOAuthUser'] = isOAuthUser;
    _data['role'] = role;
    _data['active'] = active;
    _data['_id'] = id;
    return _data;
  }
}