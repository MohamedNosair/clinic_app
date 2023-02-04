class OfferModel {
  String? message;
  bool? status;
  OfferDataModel? data;

  OfferModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ?  OfferDataModel.fromJson(json['data']) : null ;
  }

}

class OfferDataModel {
  int? currentPage;
  List<OfferData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  int? to;
  int? total;

  OfferDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add( OfferData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = [];
      json['links'].forEach((v) {
        links!.add( Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }
}

class OfferData {
  int? id;
  String? descriptionEn;
  String? description;
  String? name;
  String? nameEn;
  int? discount;
  String? discountType;
  String? status;
  String? startAt;
  String? endAt;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? image;
  User? user;

  OfferData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descriptionEn = json['description_en'];
    description = json['description'];
    name = json['name'];
    nameEn = json['name_en'];
    discount = json['discount'];
    discountType = json['discount_type'];
    status = json['status'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
  }

}

class User {
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

  User.fromJson(Map<String, dynamic> json) {
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

class Links {
  String? url;
  String? label;
  bool? active;


  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

}
