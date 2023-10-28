class ChatViewModel {
  int? id;
  String? message;
  String? file;
  String? userId;
  String? chatRoomId;
  String? deliveryTimestamp;
  String? seen;
  Null? seenTimestamp;
  String? author;
  Null? createdBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? status;
  AutherDetail? autherDetail;

  ChatViewModel(
      {this.id,
      this.message,
      this.file,
      this.userId,
      this.chatRoomId,
      this.deliveryTimestamp,
      this.seen,
      this.seenTimestamp,
      this.author,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.status,
      this.autherDetail});

  ChatViewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    file = json['file'];
    userId = json['userId'];
    chatRoomId = json['chatRoomId'];
    deliveryTimestamp = json['deliveryTimestamp'];
    seen = json['seen'];
    seenTimestamp = json['seenTimestamp'];
    author = json['author'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    status = json['status'];
    autherDetail = json['autherDetail'] != null
        ? new AutherDetail.fromJson(json['autherDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['file'] = this.file;
    data['userId'] = this.userId;
    data['chatRoomId'] = this.chatRoomId;
    data['deliveryTimestamp'] = this.deliveryTimestamp;
    data['seen'] = this.seen;
    data['seenTimestamp'] = this.seenTimestamp;
    data['author'] = this.author;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['status'] = this.status;
    if (this.autherDetail != null) {
      data['autherDetail'] = this.autherDetail!.toJson();
    }
    return data;
  }
}

class AutherDetail {
  int? id;
  String? userId;
  String? firstName;
  String? lastName;
  String? emailAddress;
  int? phoneNumber;
  String? userType;

  AutherDetail(
      {this.id,
      this.userId,
      this.firstName,
      this.lastName,
      this.emailAddress,
      this.phoneNumber,
      this.userType});

  AutherDetail.fromJson(Map<String, dynamic> json) {
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
