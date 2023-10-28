class PatientAppointmentList {
  String? status;
  String? message;
  int? total;
  List<Data>? data;

  PatientAppointmentList({this.status, this.message, this.total, this.data});

  PatientAppointmentList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  int? locationId;
  int? doctorId;
  int? patientId;
  String? bookingId;
  String? bookingDate;
  String? bookingTime;
  String? bookingAmount;
  String? bookingMethod;
  String? bookingStatus;
  String? cancelReason;
  String? createdAt;
  String? status;
  LocationDetail? locationDetail;
  DoctorDetail? doctorDetail;
  PatientDetail? patientDetail;

  Data(
      {this.id,
      this.locationId,
      this.doctorId,
      this.patientId,
      this.bookingId,
      this.bookingDate,
      this.bookingTime,
      this.bookingAmount,
      this.bookingMethod,
      this.bookingStatus,
      this.cancelReason,
      this.createdAt,
      this.status,
      this.locationDetail,
      this.doctorDetail,
      this.patientDetail});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locationId = json['locationId'];
    doctorId = json['doctorId'];
    patientId = json['patientId'];
    bookingId = json['bookingId'];
    bookingDate = json['bookingDate'];
    bookingTime = json['bookingTime'];
    bookingAmount = json['bookingAmount'];
    bookingMethod = json['bookingMethod'];
    bookingStatus = json['bookingStatus'];
    cancelReason = json['cancelReason'];
    createdAt = json['createdAt'];
    status = json['status'];
    locationDetail = json['locationDetail'] != null
        ? new LocationDetail.fromJson(json['locationDetail'])
        : null;
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
    data['locationId'] = this.locationId;
    data['doctorId'] = this.doctorId;
    data['patientId'] = this.patientId;
    data['bookingId'] = this.bookingId;
    data['bookingDate'] = this.bookingDate;
    data['bookingTime'] = this.bookingTime;
    data['bookingAmount'] = this.bookingAmount;
    data['bookingMethod'] = this.bookingMethod;
    data['bookingStatus'] = this.bookingStatus;
    data['cancelReason'] = this.cancelReason;
    data['createdAt'] = this.createdAt;
    data['status'] = this.status;
    if (this.locationDetail != null) {
      data['locationDetail'] = this.locationDetail!.toJson();
    }
    if (this.doctorDetail != null) {
      data['doctorDetail'] = this.doctorDetail!.toJson();
    }
    if (this.patientDetail != null) {
      data['patientDetail'] = this.patientDetail!.toJson();
    }
    return data;
  }
}

class LocationDetail {
  int? id;
  Null? userId;
  String? locationName;
  String? addressType;
  String? addressLine1;
  String? addressLine2;
  String? country;
  String? state;
  String? city;
  int? pincode;
  String? googlePlaceId;
  int? lat;
  int? lng;
  String? openTime;
  String? closeTime;
  String? contactNumber;
  String? email;
  String? openDays;
  String? locationImage;
  bool? isAvailable;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? status;

  LocationDetail(
      {this.id,
      this.userId,
      this.locationName,
      this.addressType,
      this.addressLine1,
      this.addressLine2,
      this.country,
      this.state,
      this.city,
      this.pincode,
      this.googlePlaceId,
      this.lat,
      this.lng,
      this.openTime,
      this.closeTime,
      this.contactNumber,
      this.email,
      this.openDays,
      this.locationImage,
      this.isAvailable,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.status});

  LocationDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    locationName = json['locationName'];
    addressType = json['addressType'];
    addressLine1 = json['addressLine1'];
    addressLine2 = json['addressLine2'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    pincode = json['pincode'];
    googlePlaceId = json['googlePlaceId'];
    lat = json['lat'];
    lng = json['lng'];
    openTime = json['openTime'];
    closeTime = json['closeTime'];
    contactNumber = json['contactNumber'];
    email = json['email'];
    openDays = json['openDays'];
    locationImage = json['locationImage'];
    isAvailable = json['isAvailable'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['locationName'] = this.locationName;
    data['addressType'] = this.addressType;
    data['addressLine1'] = this.addressLine1;
    data['addressLine2'] = this.addressLine2;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    data['googlePlaceId'] = this.googlePlaceId;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['openTime'] = this.openTime;
    data['closeTime'] = this.closeTime;
    data['contactNumber'] = this.contactNumber;
    data['email'] = this.email;
    data['openDays'] = this.openDays;
    data['locationImage'] = this.locationImage;
    data['isAvailable'] = this.isAvailable;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['status'] = this.status;
    return data;
  }
}

class DoctorDetail {
  int? id;
  String? userId;
  String? firstName;
  String? lastName;
  String? emailAddress;
  int? phoneNumber;
  String? userType;
  String? userAvatar;
  DoctorProfiles? doctorProfiles;

  DoctorDetail(
      {this.id,
      this.userId,
      this.firstName,
      this.lastName,
      this.emailAddress,
      this.phoneNumber,
      this.userType,
      this.userAvatar,
      this.doctorProfiles});

  DoctorDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailAddress = json['emailAddress'];
    phoneNumber = json['phoneNumber'];
    userType = json['userType'];
    userAvatar = json['userAvatar'];
    doctorProfiles = json['doctorProfiles'] != null
        ? new DoctorProfiles.fromJson(json['doctorProfiles'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['emailAddress'] = this.emailAddress;
    data['phoneNumber'] = this.phoneNumber;
    data['userType'] = this.userType;
    data['userAvatar'] = this.userAvatar;
    if (this.doctorProfiles != null) {
      data['doctorProfiles'] = this.doctorProfiles!.toJson();
    }
    return data;
  }
}

class DoctorProfiles {
  int? id;
  int? userId;
  Null? locationId;
  String? professionalBio;
  String? specialty;
  String? consultingLanguages;
  String? experienceInIndustry;
  String? awardsAndPublications;
  String? workingTime;
  Null? startDate;
  Null? endDate;
  String? note;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  String? status;
  Null? deletedAt;

  DoctorProfiles(
      {this.id,
      this.userId,
      this.locationId,
      this.professionalBio,
      this.specialty,
      this.consultingLanguages,
      this.experienceInIndustry,
      this.awardsAndPublications,
      this.workingTime,
      this.startDate,
      this.endDate,
      this.note,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.deletedAt});

  DoctorProfiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    locationId = json['locationId'];
    professionalBio = json['professionalBio'];
    specialty = json['specialty'];
    consultingLanguages = json['consultingLanguages'];
    experienceInIndustry = json['experienceInIndustry'];
    awardsAndPublications = json['awardsAndPublications'];
    workingTime = json['workingTime'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    note = json['note'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['locationId'] = this.locationId;
    data['professionalBio'] = this.professionalBio;
    data['specialty'] = this.specialty;
    data['consultingLanguages'] = this.consultingLanguages;
    data['experienceInIndustry'] = this.experienceInIndustry;
    data['awardsAndPublications'] = this.awardsAndPublications;
    data['workingTime'] = this.workingTime;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['note'] = this.note;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['status'] = this.status;
    data['deletedAt'] = this.deletedAt;
    return data;
  }
}

class PatientDetail {
  int? id;
  String? userId;
  String? firstName;
  String? lastName;
  String? emailAddress;
  int? phoneNumber;
  String? userType;

  PatientDetail(
      {this.id,
      this.userId,
      this.firstName,
      this.lastName,
      this.emailAddress,
      this.phoneNumber,
      this.userType});

  PatientDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailAddress = json['emailAddress'];
    phoneNumber = json['phoneNumber'];
    userType = json['userType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['emailAddress'] = this.emailAddress;
    data['phoneNumber'] = this.phoneNumber;
    data['userType'] = this.userType;
    return data;
  }
}
