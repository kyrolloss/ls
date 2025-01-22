class NutritionModel {
  List<Data>? data;

  NutritionModel({this.data});

  NutritionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? displayName;
  List<NutritionData>? nutritionData;

  Data({this.displayName, this.nutritionData});

  Data.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    if (json['nutritionData'] != null) {
      nutritionData = <NutritionData>[];
      json['nutritionData'].forEach((v) {
        nutritionData!.add(new NutritionData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    if (this.nutritionData != null) {
      data['nutritionData'] =
          this.nutritionData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NutritionData {
  String? name;
  var value;

  NutritionData({this.name, this.value});

  NutritionData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}
