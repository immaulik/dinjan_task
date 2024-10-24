class UserModel {
  String userId = "";
  String name = "";
  String phone = "";
  String profile = "";
  String email = "";
  String id = "";

  UserModel(
      {this.email = "",
      this.profile = "",
      this.phone = "",
      this.id = "",
      this.name = "",
      this.userId = ""});

  UserModel.fromJson(dynamic json) {
    userId = json["userId"] ?? "";
    name = json["name"] ?? "";
    id = json["id"] ?? "";
    phone = json["phone"] ?? "";
    profile = json["profile"] ?? "";
    email = json["email"] ?? "";
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "name": name,
      "phone": phone,
      "profile": profile,
      "email": email,
      "id": id
    };
  }
}
