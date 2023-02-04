class AppointmentModel {
  String? message;
  bool? status;
  List<AppointmentData>? data;

  AppointmentModel({this.message, this.status, this.data});

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <AppointmentData>[];
      json['data'].forEach((v) {
        data!.add( AppointmentData.fromJson(v));
      });
    }
  }

}

class AppointmentData {
  int? id;
  String? dateCenter;
  late List<String> hour;
  int? userId;
  String? createdAt;
  String? updatedAt;

  AppointmentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCenter = json['date_center'];
    hour = json['hour'].cast<String>();
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}
