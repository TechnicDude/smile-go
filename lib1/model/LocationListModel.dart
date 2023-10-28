class LocationListModel {
  String? status;
  String? message;
  int? total;
  List<Data>? data;

  LocationListModel({this.status, this.message, this.total, this.data});

  LocationListModel.fromJson(Map<String, dynamic> json) {
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
  double? distance;
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
  String? lat;
  String? lng;
  String? openTime;
  String? closeTime;
  String? contactNumber;
  String? email;
  String? openDays;
  String? createdAt;
  String? status;
  Null? userDetail;

  Data(
      {this.distance,
      this.id,
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
      this.createdAt,
      this.status,
      this.userDetail});

  Data.fromJson(Map<String, dynamic> json) {
    distance = json['distance'];
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
    createdAt = json['createdAt'];
    status = json['status'];
    userDetail = json['userDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['distance'] = this.distance;
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
    data['createdAt'] = this.createdAt;
    data['status'] = this.status;
    data['userDetail'] = this.userDetail;
    return data;
  }
}
