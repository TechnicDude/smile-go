class TopdoctorslistModel {
  String? status;
  int? total;
  List<TopdoctorslistData>? data;

  TopdoctorslistModel({this.status, this.total, this.data});

  TopdoctorslistModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    total = json['total'];
    if (json['data'] != null) {
      data = <TopdoctorslistData>[];
      json['data'].forEach((v) {
        data!.add(TopdoctorslistData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['total'] = total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopdoctorslistData {
  int? id;
  int? locationId;
  String? userId;
  String? companyName;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? userType;
  String? userRole;
  int? phoneNumber;
  String? status;
  String? userAvatar;
  LocationDetail? locationDetail;
  DoctorProfiles? doctorProfiles;
  int? isFavorite;
  bool? likeslected;

  TopdoctorslistData({
    this.id,
    this.locationId,
    this.userId,
    this.companyName,
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.userType,
    this.userRole,
    this.phoneNumber,
    this.status,
    this.userAvatar,
    this.locationDetail,
    this.doctorProfiles,
    this.isFavorite,
    bool? likeslected,
  });

  TopdoctorslistData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locationId = json['locationId'];
    userId = json['userId'];
    companyName = json['companyName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailAddress = json['emailAddress'];
    userType = json['userType'];
    userRole = json['userRole'];
    phoneNumber = json['phoneNumber'];
    status = json['status'];
    userAvatar = json['userAvatar'];
    locationDetail = json['locationDetail'] != null
        ? LocationDetail.fromJson(json['locationDetail'])
        : null;
    doctorProfiles = json['doctorProfiles'] != null
        ? DoctorProfiles.fromJson(json['doctorProfiles'])
        : null;
    isFavorite = json['isFavorite'];
    likeslected = json["isFavorite"] != null
        ? json["isFavorite"] == 0
            ? false
            : true
        : false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['locationId'] = locationId;
    data['userId'] = userId;
    data['companyName'] = companyName;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['emailAddress'] = emailAddress;
    data['userType'] = userType;
    data['userRole'] = userRole;
    data['phoneNumber'] = phoneNumber;
    data['status'] = status;
    data['userAvatar'] = userAvatar;
    if (locationDetail != null) {
      data['locationDetail'] = locationDetail!.toJson();
    }
    if (doctorProfiles != null) {
      data['doctorProfiles'] = doctorProfiles!.toJson();
    }
    data['isFavorite'] = isFavorite;
    data['likeslected'] = likeslected;

    return data;
  }
}

class LocationDetail {
  int? id;
  String? userId;
  String? locationName;
  String? addressType;
  String? addressLine1;
  String? addressLine2;
  String? country;
  String? state;
  String? city;
  int? pincode;
  String? googlePlaceId;
  String? lat;
  String? lng;
  String? openTime;
  String? closeTime;
  String? contactNumber;
  String? email;
  String? openDays;
  String? locationImage;
  bool? isAvailable;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['locationName'] = locationName;
    data['addressType'] = addressType;
    data['addressLine1'] = addressLine1;
    data['addressLine2'] = addressLine2;
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['pincode'] = pincode;
    data['googlePlaceId'] = googlePlaceId;
    data['lat'] = lat;
    data['lng'] = lng;
    data['openTime'] = openTime;
    data['closeTime'] = closeTime;
    data['contactNumber'] = contactNumber;
    data['email'] = email;
    data['openDays'] = openDays;
    data['locationImage'] = locationImage;
    data['isAvailable'] = isAvailable;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['status'] = status;
    return data;
  }
}

class DoctorProfiles {
  int? id;
  int? userId;
  String? locationId;
  String? professionalBio;
  String? specialty;
  String? consultingLanguages;
  String? experienceInIndustry;
  String? awardsAndPublications;
  String? workingTime;
  String? startDate;
  String? endDate;
  String? note;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  String? status;
  String? deletedAt;
  List<Qualifications>? qualifications;
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
      this.deletedAt,
      this.qualifications});

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
    if (json['qualifications'] != null) {
      qualifications = <Qualifications>[];
      json['qualifications'].forEach((v) {
        qualifications!.add(Qualifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['locationId'] = locationId;
    data['professionalBio'] = professionalBio;
    data['specialty'] = specialty;
    data['consultingLanguages'] = consultingLanguages;
    data['experienceInIndustry'] = experienceInIndustry;
    data['awardsAndPublications'] = awardsAndPublications;
    data['workingTime'] = workingTime;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['note'] = note;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['status'] = status;
    data['deletedAt'] = deletedAt;
    if (qualifications != null) {
      data['qualifications'] = qualifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Qualifications {
  int? id;
  int? doctorProfileId;
  String? qualificationName;
  String? startDate;
  String? endDate;
  String? note;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  String? status;
  String? deletedAt;

  Qualifications(
      {this.id,
      this.doctorProfileId,
      this.qualificationName,
      this.startDate,
      this.endDate,
      this.note,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.deletedAt});

  Qualifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorProfileId = json['doctorProfileId'];
    qualificationName = json['qualificationName'];
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctorProfileId'] = doctorProfileId;
    data['qualificationName'] = qualificationName;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['note'] = note;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['status'] = status;
    data['deletedAt'] = deletedAt;
    return data;
  }
}
