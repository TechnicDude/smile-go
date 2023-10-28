class ProfileUserModel {
  String? status;
  String? message;
  ProfileUserData? data;
  ProfileUserModel({this.status, this.message, this.data});

  ProfileUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? new ProfileUserData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProfileUserData {
  int? id;
  String? userId;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? userAvatar;
  int? phoneNumber;
  String? locationDetail;

  ProfileUserData(
      {this.id,
      this.userId,
      this.firstName,
      this.lastName,
      this.emailAddress,
      this.userAvatar,
      this.phoneNumber,
      this.locationDetail});

  ProfileUserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailAddress = json['emailAddress'];
    userAvatar = json['userAvatar'];
    phoneNumber = json['phoneNumber'];
    locationDetail = json['locationDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['emailAddress'] = this.emailAddress;
    data['userAvatar'] = this.userAvatar;
    data['phoneNumber'] = this.phoneNumber;
    data['locationDetail'] = this.locationDetail;
    return data;
  }
}
