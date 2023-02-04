class CenterModel {
  String? message;
  bool? status;
  CenterDataModel? data;


  CenterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ?  CenterDataModel.fromJson(json['data']) : null;
  }

}

class CenterDataModel {
  int? currentPage;
  List<CenterData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<CenterLinks>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;



  CenterDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add( CenterData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = [];
      json['links'].forEach((v) {
        links!.add( CenterLinks.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }
}

class CenterData {
  int? id;
  String? name;
  String? email;
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

  CenterData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
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

class CenterLinks {
  String? url;
  String? label;
  bool? active;


  CenterLinks.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
}
