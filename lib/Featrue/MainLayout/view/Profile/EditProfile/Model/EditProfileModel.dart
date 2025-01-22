class EditProfileModel {
  EditProfileModel({
    required this.data,
  });
  late final Data data;

  EditProfileModel.fromJson(Map<String, dynamic> json){
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
    required this.username,
    required this.email,
    required this.phone,
    required this.isOAuthUser,
    required this.role,
    required this.active,
    required this.age,
    required this.length,
    required this.targetWeight,
    required this.weight,
  });
  late final String id;
  late final String username;
  late final String email;
  late final String phone;
  late final bool isOAuthUser;
  late final String role;
  late final bool active;
  late final int age;
  late final String length;
  late final String targetWeight;
  late final String weight;

  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    isOAuthUser = json['isOAuthUser'];
    role = json['role'];
    active = json['active'];
    age = json['age'];
    length = json['length'];
    targetWeight = json['targetWeight'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['isOAuthUser'] = isOAuthUser;
    _data['role'] = role;
    _data['active'] = active;
    _data['age'] = age;
    _data['length'] = length;
    _data['targetWeight'] = targetWeight;
    _data['weight'] = weight;
    return _data;
  }
}