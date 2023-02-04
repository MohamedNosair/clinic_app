class PackageDetailsModel {
  String? message;
  bool? status;
  PackageDetailsData? data;

  PackageDetailsModel({this.message, this.status, this.data});

  PackageDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ?  PackageDetailsData.fromJson(json['data']) : null;
  }
}

class PackageDetailsData {
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
  PackageDetailsUser? user;
  List<PackageDetailsService>? packageService;

  PackageDetailsData(
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
        this.user,
        this.packageService});

  PackageDetailsData.fromJson(Map<String, dynamic> json) {
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
    user = json['user'] != null ?  PackageDetailsUser.fromJson(json['user']) : null;
    if (json['package_service'] != null) {
      packageService = <PackageDetailsService>[];
      json['package_service'].forEach((v) {
        packageService!.add( PackageDetailsService.fromJson(v));
      });
    }
  }
}

class PackageDetailsUser {
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

  PackageDetailsUser(
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

  PackageDetailsUser.fromJson(Map<String, dynamic> json) {
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

class PackageDetailsService {
  int? id;
  String? name;
  String? nameEn;
  int? packagePrice;
  String? description;
  String? descriptionEn;
  int? userId;
  int? packageId;
  int? serviceId;
  Null? createdAt;
  Null? updatedAt;

  PackageDetailsService(
      {this.id,
        this.name,
        this.nameEn,
        this.packagePrice,
        this.description,
        this.descriptionEn,
        this.userId,
        this.packageId,
        this.serviceId,
        this.createdAt,
        this.updatedAt});

  PackageDetailsService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameEn = json['name_en'];
    packagePrice = json['package_price'];
    description = json['description'];
    descriptionEn = json['description_en'];
    userId = json['user_id'];
    packageId = json['package_id'];
    serviceId = json['service_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}
