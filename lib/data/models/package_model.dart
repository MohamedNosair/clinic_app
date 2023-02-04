class PackageModel {
  String? message;
  bool? status;
  PackageModelData? data;
  PackageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ?  PackageModelData.fromJson(json['data']) : null;
  }
}

class PackageModelData {
  int? currentPage;
  List<PackageData>? data;
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



  PackageModelData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add( PackageData.fromJson(v));
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

class PackageData {
  int? id;
  String? descriptionEn;
  String? description;
  String? name;
  String? nameEn;
  int? price;
  String? image;
  int? status;
  int? userId;
  String? createdAt;
  String? updatedAt;
  User? user;

  PackageData(
      {this.id,
        this.descriptionEn,
        this.description,
        this.name,
        this.nameEn,
        this.price,
        this.image,
        this.status,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.user});

  PackageData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descriptionEn = json['description_en'];
    description = json['description'];
    name = json['name'];
    nameEn = json['name_en'];
    price = json['price'];
    image = json['image'];
    status = json['status'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
  }
}

class User {
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

  User(
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

  User.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['phone'] = this.phone;
    data['activity_id'] = this.activityId;
    data['city_id'] = this.cityId;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['address'] = this.address;
    data['address_en'] = this.addressEn;
    data['about_en'] = this.aboutEn;
    data['about'] = this.about;
    data['image'] = this.image;
    data['logo'] = this.logo;
    data['name_en'] = this.nameEn;
    data['role'] = this.role;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
