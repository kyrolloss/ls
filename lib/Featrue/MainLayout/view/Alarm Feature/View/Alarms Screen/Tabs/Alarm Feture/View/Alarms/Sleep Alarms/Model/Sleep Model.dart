class Sleep {
  String name;
  String time;
  int id = 0;
  bool status = false;


  Sleep({required this.name, required this.time , required this.id , required this.status});

  Map<String, String> toJson() {
    return {
      'name': name,
      'time': time,
      'id': id.toString(),
      'status': status.toString(),
    };
  }

  factory Sleep.fromJson(Map<String, dynamic> json) {
    return Sleep(
      name: json['name'],
      time: json['time'],
      id: int.parse(json['id']), status: bool.parse(json['status']),
    );
  }
}