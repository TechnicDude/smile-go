class FovoritedoctorModel {
  String? status;
  String? message;
  int? total;
  List<FovoriteData>? data;

  FovoritedoctorModel({this.status, this.message, this.total, this.data});

  FovoritedoctorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = <FovoriteData>[];
      json['data'].forEach((v) {
        data!.add(new FovoriteData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['total'] = this.total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FovoriteData {
  int? id;
  int? doctorId;
  int? patientId;
  String? type;
  String? createdAt;
  String? status;
  DoctorDetail? doctorDetail;
  PatientDetail? patientDetail;

  FovoriteData(
      {this.id,
      this.doctorId,
      this.patientId,
      this.type,
      this.createdAt,
      this.status,
      this.doctorDetail,
      this.patientDetail});

  FovoriteData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctorId'];
    patientId = json['patientId'];
    type = json['type'];
    createdAt = json['createdAt'];
    status = json['status'];
    doctorDetail = json['doctorDetail'] != null
        ? new DoctorDetail.fromJson(json['doctorDetail'])
        : null;
    patientDetail = json['patientDetail'] != null
        ? new PatientDetail.fromJson(json['patientDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctorId'] = this.doctorId;
    data['patientId'] = this.patientId;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['status'] = this.status;
    if (this.doctorDetail != null) {
      data['doctorDetail'] = this.doctorDetail!.toJson();
    }
    if (this.patientDetail != null) {
      data['patientDetail'] = this.patientDetail!.toJson();
    }
    return data;
  }
}

class DoctorDetail {
  int? id;
  String? userId;
  int? locationId;
  String? companyName;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? userType;
  String? userRole;
  int? phoneNumber;
  String? status;
  String? userAvatar;

  DoctorDetail(
      {this.id,
      this.userId,
      this.locationId,
      this.companyName,
      this.firstName,
      this.lastName,
      this.emailAddress,
      this.userType,
      this.userRole,
      this.phoneNumber,
      this.status,
      this.userAvatar});

  DoctorDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    locationId = json['locationId'];
    companyName = json['companyName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailAddress = json['emailAddress'];
    userType = json['userType'];
    userRole = json['userRole'];
    phoneNumber = json['phoneNumber'];
    status = json['status'];
    userAvatar = json['userAvatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['locationId'] = this.locationId;
    data['companyName'] = this.companyName;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['emailAddress'] = this.emailAddress;
    data['userType'] = this.userType;
    data['userRole'] = this.userRole;
    data['phoneNumber'] = this.phoneNumber;
    data['status'] = this.status;
    data['userAvatar'] = this.userAvatar;
    return data;
  }
}

class PatientDetail {
  int? id;
  String? userId;
  String? locationId;
  String? companyName;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? userType;
  String? userRole;
  int? phoneNumber;
  String? status;
  String? userAvatar;

  PatientDetail(
      {this.id,
      this.userId,
      this.locationId,
      this.companyName,
      this.firstName,
      this.lastName,
      this.emailAddress,
      this.userType,
      this.userRole,
      this.phoneNumber,
      this.status,
      this.userAvatar});

  PatientDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    locationId = json['locationId'];
    companyName = json['companyName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailAddress = json['emailAddress'];
    userType = json['userType'];
    userRole = json['userRole'];
    phoneNumber = json['phoneNumber'];
    status = json['status'];
    userAvatar = json['userAvatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['locationId'] = this.locationId;
    data['companyName'] = this.companyName;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['emailAddress'] = this.emailAddress;
    data['userType'] = this.userType;
    data['userRole'] = this.userRole;
    data['phoneNumber'] = this.phoneNumber;
    data['status'] = this.status;
    data['userAvatar'] = this.userAvatar;
    return data;
  }
}
