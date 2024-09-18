class UserTokenModel {
  bool? success;
  String? message;
  String? token;
  User? user;

  UserTokenModel({this.success, this.message, this.token, this.user});

  UserTokenModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? userName;
  String? email;
  List<String>? address;
  String? phone;
  String? usertype;
  String? profile;
  String? answer;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.sId,
      this.userName,
      this.email,
      this.address,
      this.phone,
      this.usertype,
      this.profile,
      this.answer,
      this.createdAt,
      this.updatedAt,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    email = json['email'];
    address = json['address'].cast<String>();
    phone = json['phone'];
    usertype = json['usertype'];
    profile = json['profile'];
    answer = json['answer'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['usertype'] = this.usertype;
    data['profile'] = this.profile;
    data['answer'] = this.answer;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
