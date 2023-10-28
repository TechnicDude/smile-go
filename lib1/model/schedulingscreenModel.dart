class schedulingModel {
  int? startDate;
  int? endDate;
  List<String>? dates;
  List<AvailabilityDates>? availabilityDates;

  schedulingModel(
      {this.startDate, this.endDate, this.dates, this.availabilityDates});

  schedulingModel.fromJson(Map<String, dynamic> json) {
    startDate = json['startDate'];
    endDate = json['endDate'];
    dates = json['dates'].cast<String>();
    if (json['availabilityDates'] != null) {
      availabilityDates = <AvailabilityDates>[];
      json['availabilityDates'].forEach((v) {
        availabilityDates!.add(new AvailabilityDates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['dates'] = this.dates;
    if (this.availabilityDates != null) {
      data['availabilityDates'] =
          this.availabilityDates!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AvailabilityDates {
  String? date;
  List<Slots>? slots;
  LocationDetail? locationDetail;
  DoctorDetail? doctorDetail;

  AvailabilityDates(
      {this.date, this.slots, this.locationDetail, this.doctorDetail});

  AvailabilityDates.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['slots'] != null) {
      slots = <Slots>[];
      json['slots'].forEach((v) {
        slots!.add(new Slots.fromJson(v));
      });
    }
    locationDetail = json['locationDetail'] != null
        ? new LocationDetail.fromJson(json['locationDetail'])
        : null;
    doctorDetail = json['doctorDetail'] != null
        ? new DoctorDetail.fromJson(json['doctorDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.slots != null) {
      data['slots'] = this.slots!.map((v) => v.toJson()).toList();
    }
    if (this.locationDetail != null) {
      data['locationDetail'] = this.locationDetail!.toJson();
    }
    if (this.doctorDetail != null) {
      data['doctorDetail'] = this.doctorDetail!.toJson();
    }
    return data;
  }
}

class Slots {
  String? time;
  bool? isAvail;

  Slots({this.time, this.isAvail});

  Slots.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    isAvail = json['isAvail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['isAvail'] = this.isAvail;
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
  String? facebookId;
  String? googleId;
  String? appleId;
  String? firstName;
  String? lastName;
  String? emailAddress;
  bool? emailVarified;
  int? phoneNumber;
  String? phoneVarified;
  String? userPassword;
  String? age;
  String? gender;
  String? otpCode;
  String? otpExpire;
  String? token;
  String? lastLogin;
  String? companyName;
  String? startDate;
  String? endDate;
  String? dateOfBirth;
  int? locationId;
  String? userRole;
  String? userType;
  String? userAvatar;
  String? status;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  DoctorDetail(
      {this.id,
      this.userId,
      this.facebookId,
      this.googleId,
      this.appleId,
      this.firstName,
      this.lastName,
      this.emailAddress,
      this.emailVarified,
      this.phoneNumber,
      this.phoneVarified,
      this.userPassword,
      this.age,
      this.gender,
      this.otpCode,
      this.otpExpire,
      this.token,
      this.lastLogin,
      this.companyName,
      this.startDate,
      this.endDate,
      this.dateOfBirth,
      this.locationId,
      this.userRole,
      this.userType,
      this.userAvatar,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  DoctorDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    facebookId = json['facebookId'];
    googleId = json['googleId'];
    appleId = json['appleId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailAddress = json['emailAddress'];
    emailVarified = json['emailVarified'];
    phoneNumber = json['phoneNumber'];
    phoneVarified = json['phoneVarified'];
    userPassword = json['userPassword'];
    age = json['age'];
    gender = json['gender'];
    otpCode = json['otpCode'];
    otpExpire = json['otpExpire'];
    token = json['token'];
    lastLogin = json['lastLogin'];
    companyName = json['companyName'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    dateOfBirth = json['dateOfBirth'];
    locationId = json['locationId'];
    userRole = json['userRole'];
    userType = json['userType'];
    userAvatar = json['userAvatar'];
    status = json['status'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['facebookId'] = this.facebookId;
    data['googleId'] = this.googleId;
    data['appleId'] = this.appleId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['emailAddress'] = this.emailAddress;
    data['emailVarified'] = this.emailVarified;
    data['phoneNumber'] = this.phoneNumber;
    data['phoneVarified'] = this.phoneVarified;
    data['userPassword'] = this.userPassword;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['otpCode'] = this.otpCode;
    data['otpExpire'] = this.otpExpire;
    data['token'] = this.token;
    data['lastLogin'] = this.lastLogin;
    data['companyName'] = this.companyName;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['dateOfBirth'] = this.dateOfBirth;
    data['locationId'] = this.locationId;
    data['userRole'] = this.userRole;
    data['userType'] = this.userType;
    data['userAvatar'] = this.userAvatar;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    return data;
  }
}
