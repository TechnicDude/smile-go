import 'package:flutter/material.dart';
import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/api/apphelper.dart';
import 'package:smile_and_go_app/api/chatsapi.dart';
import 'package:smile_and_go_app/utils/dialoghelper.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatScreenPage extends StatefulWidget {
  final String name, image, doctorId;
  const ChatScreenPage(
      {Key? key,
      required this.name,
      required this.image,
      required this.doctorId})
      : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreenPage> {
  late IO.Socket socket;
  TextEditingController messageController = TextEditingController();
  List<String> messages = [];
  String chatRomId = '';

  @override
  void initState() {
    super.initState();
    connectToServer();
    creatChateRoom();
  }

  Future creatChateRoom() async {
    var data = {
      "doctorId": widget.doctorId.toString(),
    };
    print("doctorId" + widget.doctorId.toString());
    chatsapi responsedata = chatsapi(data);

    final response = await responsedata.createchatRoom();

    if (response['status'] == "success") {
      print(response["data"]["id"]);
      chatRomId = response["data"]["id"].toString();
    } else {
      DialogHelper.showFlutterToast(strMsg: "Something went wrong !");
    }
  }

  void connectToServer() {
    print("jgkfjgh");
    socket = IO.io(
        APIURL.SOCKETURL,
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect()
            .setQuery({"token": AppHelper.AUTH_TOKEN_VALUE})
            .build());
    socket.connect();

    socket.onConnect((_) {
      print('Connection Successfully Established...');

      socket.on('connected', (data) {
        print("connected");
      });
      socket.on('newMessage', (data) {
        print("helloogkj");
      });
    });

    socket.on('newMessage', (data) {
      setState(() {
        print("lfkjhghj");
        //print(data.toString());

        /// messages.add(data);
      });
    });
  }

  void sendMessage() {
    String message = messageController.text.trim();
    if (message.isNotEmpty) {
      //  socket.emit('chat_message', message);
      print("idd " + chatRomId);
      socket.emit('createMessage', {
        "message": message,
        "author": AppHelper.userid,
        "chatRoomId": chatRomId
      });
      messageController.clear();
    }
    setState(() {});
  }

  getResponsefromServer() {
    print("response ");
    socket.onConnect((data) {
      socket.on("newMessage", (msg) {
        print("Received message from server ");
        print(msg);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getResponsefromServer();
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Socket.IO Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(messages[index]),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: 'Type your message here...',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: sendMessage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
