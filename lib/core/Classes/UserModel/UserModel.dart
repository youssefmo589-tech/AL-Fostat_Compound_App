class UserModel {
  static const String usercollectionname = "UserCollection";

  final String? name;

  final String? userid;

  final String? email;

  final String phone;

  String ? image;

  final String? buildingNumber;

  final String? apartmentNumber;

  final bool isTenant;

  final bool isOwner;

  final bool isPay;

  final String ? fcmtoken;

  UserModel({
    this.image,
    this.userid,
    required this.name,
    required this.email,
    required this.phone,
    required this.buildingNumber,
    required this.apartmentNumber,
    this.isTenant = false,
    this.isOwner = false,
    this.isPay = false,
    this.fcmtoken
  });

  factory UserModel.fromfirestore(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      userid: json["userid"],
      email: json["email"],
      phone: json["phone"],
      buildingNumber: json["buildingNumber"],
      apartmentNumber: json["apartmentNumber"],
      isTenant: json['isTenant'],
      isOwner: json['isOwner'],
      isPay: json['isPay'],
        fcmtoken: json['fcmtoken'],
        image: json['image']
    );
  }

  Map<String, dynamic> tofirestore() {
    return {
      "name": name,
      "userid": userid,
      "email": email,
      "phone": phone,
      "buildingNumber": buildingNumber,
      "apartmentNumber": apartmentNumber,
      "isTenant": isTenant,
      "isOwner": isOwner,
      "isPay": isPay,
      "fcmtoken": fcmtoken,
      "image": image
    };
  }
}
