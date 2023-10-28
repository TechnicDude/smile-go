class Chat {
  String? message;
  String? author;
  String? chatRoomId;

  Chat({this.message, this.author, this.chatRoomId});

  Chat.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    author = json['author'];
    chatRoomId = json['chatRoomId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['author'] = author;
    data['chatRoomId'] = chatRoomId;
    return data;
  }
}
