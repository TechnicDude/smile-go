class Chat {
  final String? userId;
  final String? message;
  Chat({
    this.userId,
    this.message,
  });
  factory Chat.fromRawJson(Map<String, dynamic> jsonData) {
    return Chat(
      userId: jsonData['userId'],
      message: jsonData['message'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "message": message,
    };
  }
}
