class OfferDetailsModel {
  String? message;
  bool? status;
  late OfferDetailsData data;

  OfferDetailsModel({this.message, this.status, required this.data});

  OfferDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = (json['data'] != null ?  OfferDetailsData.fromJson(json['data']) : null)!;
  }
}

class OfferDetailsData {
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
  OfferDetailsUser? user;
  List<OfferDetailsService>? offerService;

  OfferDetailsData(
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
        this.deletedAt,
        this.user,
        this.offerService});

  OfferDetailsData.fromJson(Map<String, dynamic> json) {
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
    user = json['user'] != null ?  OfferDetailsUser.fromJson(json['user']) : null;
    if (json['offer_service'] != null) {
      offerService = <OfferDetailsService>[];
      json['offer_service'].forEach((v) {
        offerService!.add( OfferDetailsService.fromJson(v));
      });
    }
  }

}

class OfferDetailsUser {
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

  OfferDetailsUser(
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

  OfferDetailsUser.fromJson(Map<String, dynamic> json) {
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

class OfferDetailsService {
  int? id;
  String? name;
  String? nameEn;
  int? offerPrice;
  String? description;
  String? descriptionEn;
  int? userId;
  int? offerId;
  int? serviceId;
  Null? createdAt;
  Null? updatedAt;
  String? status;

  OfferDetailsService(
      {this.id,
        this.name,
        this.nameEn,
        this.offerPrice,
        this.description,
        this.descriptionEn,
        this.userId,
        this.offerId,
        this.serviceId,
        this.createdAt,
        this.updatedAt,
        this.status});

  OfferDetailsService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameEn = json['name_en'];
    offerPrice = json['offer_price'];
    description = json['description'];
    descriptionEn = json['description_en'];
    userId = json['user_id'];
    offerId = json['offer_id'];
    serviceId = json['service_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
  }
}
