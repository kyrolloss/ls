class BuyCourseModel {
  BuyCourseModel({
    required this.status,
    required this.approvalUrl,
  });
  late final String status;
  late final String approvalUrl;

  BuyCourseModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    approvalUrl = json['approvalUrl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['approvalUrl'] = approvalUrl;
    return _data;
  }
}