class FoodCalculatorDetailsModel {
  FoodCalculatorDetailsModel({
    required this.data,
  });
  late final Data data;

  FoodCalculatorDetailsModel.fromJson(Map<String, dynamic> json){
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
    required this.mealCategory,
    required this.image,
    required this.calculationData,
  });
  late final String id;
  late final MealCategory mealCategory;
  late final String image;
  late final CalculationData calculationData;

  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    mealCategory = MealCategory.fromJson(json['mealCategory']);
    image = json['image'];
    calculationData = CalculationData.fromJson(json['calculationData']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['mealCategory'] = mealCategory.toJson();
    _data['image'] = image;
    _data['calculationData'] = calculationData.toJson();
    return _data;
  }
}

class MealCategory {
  MealCategory({
    required this.id,
    required this.TitleAR,
    required this.TitleEN,
  });
  late final String id;
  late final String TitleAR;
  late final String TitleEN;

  MealCategory.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    TitleAR = json['Title_AR'];
    TitleEN = json['Title_EN'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['Title_AR'] = TitleAR;
    _data['Title_EN'] = TitleEN;
    return _data;
  }
}

class CalculationData {
  CalculationData({
    required this.Calories,
    required this.Protein,
    required this.Carbohydrates,
    required this.Fats,
    required this.Fiber,
    required this.Sugar,
    required this.VitaminA,
    required this.VitaminB1,
    required this.VitaminB2,
    required this.VitaminB3,
    required this.VitaminB5,
    required this.VitaminB6,
    required this.VitaminB7,
    required this.VitaminB9,
    required this.VitaminB12,
    required this.VitaminC,
    required this.VitaminD,
    required this.VitaminE,
    required this.VitaminK,
    required this.Calcium,
    required this.Iron,
    required this.Magnesium,
    required this.Phosphorus,
    required this.Potassium,
    required this.Sodium,
    required this.Zinc,
    required this.Copper,
    required this.Manganese,
    required this.Selenium,
  });

  late final int Calories;
  late final double Protein;
  late final double Carbohydrates;
  late final double Fats;
  late final double Fiber;
  late final double Sugar;
  late final double VitaminA;
  late final double VitaminB1;
  late final double VitaminB2;
  late final double VitaminB3;
  late final double VitaminB5;
  late final double VitaminB6;
  late final double VitaminB7;
  late final double VitaminB9;
  late final int VitaminB12;
  late final double VitaminC;
  late final int VitaminD;
  late final double VitaminE;
  late final double VitaminK;
  late final int Calcium;
  late final double Iron;
  late final int Magnesium;
  late final int Phosphorus;
  late final int Potassium;
  late final int Sodium;
  late final double Zinc;
  late final double Copper;
  late final double Manganese;
  late final double Selenium;

  CalculationData.fromJson(Map<String, dynamic> json) {
    Calories = (json['Calories'] as num).toInt();
    Protein = (json['Protein'] as num).toDouble();
    Carbohydrates = (json['Carbohydrates'] as num).toDouble();
    Fats = (json['Fats'] as num).toDouble();
    Fiber = (json['Fiber'] as num).toDouble();
    Sugar = (json['Sugar'] as num).toDouble();
    VitaminA = (json['Vitamin_A'] as num).toDouble();
    VitaminB1 = (json['Vitamin_B1'] as num).toDouble();
    VitaminB2 = (json['Vitamin_B2'] as num).toDouble();
    VitaminB3 = (json['Vitamin_B3'] as num).toDouble();
    VitaminB5 = (json['Vitamin_B5'] as num).toDouble();
    VitaminB6 = (json['Vitamin_B6'] as num).toDouble();
    VitaminB7 = (json['Vitamin_B7'] as num).toDouble();
    VitaminB9 = (json['Vitamin_B9'] as num).toDouble();
    VitaminB12 = (json['Vitamin_B12'] as num).toInt();
    VitaminC = (json['Vitamin_C'] as num).toDouble();
    VitaminD = (json['Vitamin_D'] as num).toInt();
    VitaminE = (json['Vitamin_E'] as num).toDouble();
    VitaminK = (json['Vitamin_K'] as num).toDouble();
    Calcium = (json['Calcium'] as num).toInt();
    Iron = (json['Iron'] as num).toDouble();
    Magnesium = (json['Magnesium'] as num).toInt();
    Phosphorus = (json['Phosphorus'] as num).toInt();
    Potassium = (json['Potassium'] as num).toInt();
    Sodium = (json['Sodium'] as num).toInt();
    Zinc = (json['Zinc'] as num).toDouble();
    Copper = (json['Copper'] as num).toDouble();
    Manganese = (json['Manganese'] as num).toDouble();
    Selenium = (json['Selenium'] as num).toDouble();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Calories'] = Calories;
    _data['Protein'] = Protein;
    _data['Carbohydrates'] = Carbohydrates;
    _data['Fats'] = Fats;
    _data['Fiber'] = Fiber;
    _data['Sugar'] = Sugar;
    _data['Vitamin_A'] = VitaminA;
    _data['Vitamin_B1'] = VitaminB1;
    _data['Vitamin_B2'] = VitaminB2;
    _data['Vitamin_B3'] = VitaminB3;
    _data['Vitamin_B5'] = VitaminB5;
    _data['Vitamin_B6'] = VitaminB6;
    _data['Vitamin_B7'] = VitaminB7;
    _data['Vitamin_B9'] = VitaminB9;
    _data['Vitamin_B12'] = VitaminB12;
    _data['Vitamin_C'] = VitaminC;
    _data['Vitamin_D'] = VitaminD;
    _data['Vitamin_E'] = VitaminE;
    _data['Vitamin_K'] = VitaminK;
    _data['Calcium'] = Calcium;
    _data['Iron'] = Iron;
    _data['Magnesium'] = Magnesium;
    _data['Phosphorus'] = Phosphorus;
    _data['Potassium'] = Potassium;
    _data['Sodium'] = Sodium;
    _data['Zinc'] = Zinc;
    _data['Copper'] = Copper;
    _data['Manganese'] = Manganese;
    _data['Selenium'] = Selenium;
    return _data;
  }
}
