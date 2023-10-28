import 'dart:async';

import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/api/apphelper.dart';
import 'package:smile_and_go_app/chats/ChatViewModel.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  //static final _socketResponse = StreamController<ChatViewModel>.broadcast();
  static late StreamController<ChatViewModel> _socketResponse;

  static late io.Socket _socket;

  static Stream<ChatViewModel> get getResponse =>
      _socketResponse.stream.asBroadcastStream();

  static void sendMessage(String message, String chatRomId, String file) {
    print("base64     " + file);
    if (message.isNotEmpty) {
      _socket.emit('createMessage', {
        "message": message,
        "author": AppHelper.userid,
        "chatRoomId": chatRomId,
      });
    } else {
      _socket.emit('createMessage', {
        "file": file,
        "author": AppHelper.userid,
        "chatRoomId": chatRomId,
      });
    }
  }

  static void connectAndListen() {
    _socketResponse = StreamController<ChatViewModel>.broadcast();

    _socket = io.io(
        APIURL.SOCKETURL,
        io.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect()
            .setQuery({"token": AppHelper.AUTH_TOKEN_VALUE})
            .build());
    _socket.connect();

    //When an event recieved from server, data is added to the stream
    _socket.on('newMessage', (data) {
      _socketResponse.sink.add(ChatViewModel.fromJson(data));
      print(data);
    });
  }

  static void dispose() {
    _socket.dispose();
    _socket.destroy();
    _socket.close();
    _socket.disconnect();
    _socketResponse.close();
  }
}
