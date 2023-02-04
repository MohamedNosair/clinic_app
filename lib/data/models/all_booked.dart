class BookedModel {
  String? message;
  bool? status;
  BookedDataModel? data;

  BookedModel({this.message, this.status, this.data});

  BookedModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ?  BookedDataModel.fromJson(json['data']) : null;
  }

}

class BookedDataModel {
  int? currentPage;
  List<BookedData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<BookedLinks>? links;
  Null? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  BookedDataModel(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  BookedDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <BookedData>[];
      json['data'].forEach((v) {
        data!.add( BookedData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <BookedLinks>[];
      json['links'].forEach((v) {
        links!.add( BookedLinks.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

}

class BookedData {
  int? id;
  String? appointmentDate;
  int? code;
  String? appointmentHour;
  Null? note;
  String? status;
  String? bookingFrom;
  List<String>? clientData;
  int? userId;
  String? createdAt;
  String? updatedAt;
  int? clientId;
  BookedUser? user;

  BookedData(
      {this.id,
        this.appointmentDate,
        this.code,
        this.appointmentHour,
        this.note,
        this.status,
        this.bookingFrom,
        this.clientData,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.clientId,
        this.user});

  BookedData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appointmentDate = json['appointment_date'];
    code = json['code'];
    appointmentHour = json['appointment_hour'];
    note = json['note'];
    status = json['status'];
    bookingFrom = json['booking_from'];
    clientData = json['client_data'].cast<String>();
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    clientId = json['client_id'];
    user = json['user'] != null ?  BookedUser.fromJson(json['user']) : null;
  }

}

class BookedUser {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? phone;
  int? activityId;
  int? cityId;
  String? lat;
  String? long;
  String? address;
  String? addressEn;
  String? aboutEn;
  String? about;
  String? image;
  String? logo;
  String? nameEn;
  String? role;

  BookedUser(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.phone,
        this.activityId,
        this.cityId,
        this.lat,
        this.long,
        this.address,
        this.addressEn,
        this.aboutEn,
        this.about,
        this.image,
        this.logo,
        this.nameEn,
        this.role});

  BookedUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    phone = json['phone'];
    activityId = json['activity_id'];
    cityId = json['city_id'];
    lat = json['lat'];
    long = json['long'];
    address = json['address'];
    addressEn = json['address_en'];
    aboutEn = json['about_en'];
    about = json['about'];
    image = json['image'];
    logo = json['logo'];
    nameEn = json['name_en'];
    role = json['role'];
  }

}

class BookedLinks {
  String? url;
  String? label;
  bool? active;

  BookedLinks({this.url, this.label, this.active});

  BookedLinks.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

}
