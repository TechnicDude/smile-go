import 'dart:async';
import 'package:smile_and_go_app/chats/ChatViewModel.dart';

class StreamSocket {
  final _socketResponse = StreamController<ChatViewModel>.broadcast();
  void Function(ChatViewModel) get addResponse => _socketResponse.sink.add;
  Stream<ChatViewModel> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
  
}
