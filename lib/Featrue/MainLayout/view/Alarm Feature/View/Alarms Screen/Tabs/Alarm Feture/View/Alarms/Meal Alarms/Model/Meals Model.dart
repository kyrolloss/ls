class Meal {
  String name;
  String time;
  int id = 0;
  bool status = false;

  Meal({required this.name, required this.time , required this.id , required this.status});

  Map<String, String> toJson() {
    return {
      'name': name,
      'time': time,
      'id': id.toString(),
      'status': status.toString(),
    };
  }

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      name: json['name'],
      time: json['time'],
      id: int.parse(json['id']),
      status: bool.parse(json['status']),
    );
  }
}