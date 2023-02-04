class UserModel {

  String? token;
  String? message;
  bool? status;
  UserData? user;

  UserModel.formJson(Map<String , dynamic> json) {
    token = json['token'];
    status = json['status'] == 400 ? json['status'] : json['status'] ;
    message = json['message'];
    user = json['user'] != null ? UserData.formJson(json['user']) : null ;



  }
}

class UserData {

  late int id;

  late String name;

  late String email;

  late String phone;

  UserData.formJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }
}








// class Welcome3 {
//   Welcome3({
//     required this.token,
//     required this.user,
//   });
//
//   String token;
//   User user;
// }
//
// class User {
//   User({
//     this.id,
//     this.name,
//     this.email,
//     this.phone,
//     this.emailVerifiedAt,
//     this.rememberToken,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   int id;
//   String name;
//   String email;
//   String phone;
//   dynamic emailVerifiedAt;
//   dynamic rememberToken;
//   DateTime createdAt;
//   DateTime updatedAt;
// }
























