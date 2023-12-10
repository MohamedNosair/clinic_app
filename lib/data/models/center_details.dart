class CenterDetailsModel {
  String? message;
  bool? status;
  late CenterDetailsData data;

  CenterDetailsModel({this.message, this.status, required this.data});

  CenterDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = (json['data'] != null ?  CenterDetailsData.fromJson(json['data']) : null)!;
  }

}

class CenterDetailsData {
  late int id;
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
  List<CenterDetailsOffer>? offer;
  List<CenterDetailsPackage>? package;
  List<CenterDetailsCategory>? category;

  CenterDetailsData(
      {required this.id,
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
        this.role,
        this.offer,
        this.package,
        this.category});

  CenterDetailsData.fromJson(Map<String, dynamic> json) {
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
    if (json['offer'] != null) {
      offer = <CenterDetailsOffer>[];
      json['offer'].forEach((v) {
        offer!.add( CenterDetailsOffer.fromJson(v));
      });
    }
    if (json['package'] != null) {
      package = <CenterDetailsPackage>[];
      json['package'].forEach((v) {
        package!.add( CenterDetailsPackage.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = <CenterDetailsCategory>[];
      json['category'].forEach((v) {
        category!.add( CenterDetailsCategory.fromJson(v));
      });
    }
  }
}

class CenterDetailsOffer {
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
  Null? deletedAt;

  CenterDetailsOffer(
      {this.id,
        this.descriptionEn,
        this.description,
        this.name,
        this.nameEn,
        this.discount,
        this.discountType,
        this.status,
        this.startAt,
        this.endAt,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.image,
        this.deletedAt});

  CenterDetailsOffer.fromJson(Map<String, dynamic> json) {
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
    deletedAt = json['deleted_at'];
  }

}

class CenterDetailsPackage {
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

  CenterDetailsPackage(
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
        this.updatedAt});

  CenterDetailsPackage.fromJson(Map<String, dynamic> json) {
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
  }

}

class CenterDetailsCategory {
  int? id;
  String? nameEn;
  String? name;
  int? clinicId;
  String? createdAt;
  String? updatedAt;
  int? userId;

  CenterDetailsCategory(
      {this.id,
        this.nameEn,
        this.name,
        this.clinicId,
        this.createdAt,
        this.updatedAt,
        this.userId});

  CenterDetailsCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    name = json['name'];
    clinicId = json['clinic_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
  }
}


