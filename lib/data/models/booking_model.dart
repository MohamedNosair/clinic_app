class BookingModel {
  String? message;
  bool? status;
  BookingData? data;

  BookingModel({this.message, this.status, this.data});

  BookingModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? BookingData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class BookingData {
  String? appointmentHour;
  String? appointmentDate;
  String? userId;
  int? clientId;
  List<String>? clientData;
  int? code;
  String? bookingFrom;
  String? updatedAt;
  String? createdAt;
  int? id;

  BookingData(
      {this.appointmentHour,
        this.appointmentDate,
        this.userId,
        this.clientId,
        this.clientData,
        this.code,
        this.bookingFrom,
        this.updatedAt,
        this.createdAt,
        this.id});

  BookingData.fromJson(Map<String, dynamic> json) {
    appointmentHour = json['appointment_hour'];
    appointmentDate = json['appointment_date'];
    userId = json['user_id'];
    clientId = json['client_id'];
    clientData = json['client_data'].cast<String>();
    code = json['code'];
    bookingFrom = json['booking_from'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['appointment_hour'] = appointmentHour;
    data['appointment_date'] = appointmentDate;
    data['user_id'] = userId;
    data['client_id'] = clientId;
    data['client_data'] = clientData;
    data['code'] = code;
    data['booking_from'] = bookingFrom;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
