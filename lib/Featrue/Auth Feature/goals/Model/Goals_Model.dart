class GoalsModel {
  GoalsModel({
    required this.data,
  });
  late final Data data;

  GoalsModel.fromJson(Map<String, dynamic> json){
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
    required this.age,
    required this.gender,
    required this.length,
    required this.weight,
    required this.targetWeight,
  });
  late final int age;
  late final String gender;
  late final String length;
  late final String weight;
  late final String targetWeight;

  Data.fromJson(Map<String, dynamic> json){
    age = json['age'];
    gender = json['gender'];
    length = json['length'];
    weight = json['weight'];
    targetWeight = json['targetWeight'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['age'] = age;
    _data['gender'] = gender;
    _data['length'] = length;
    _data['weight'] = weight;
    _data['targetWeight'] = targetWeight;
    return _data;
  }
}