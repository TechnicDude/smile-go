import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/api/chatsapi.dart';
import 'package:smile_and_go_app/chats/ChatDetailsModel.dart';
import 'package:smile_and_go_app/chats/ChatViewModel.dart';
import 'package:smile_and_go_app/chats/MessageModel%20.dart';
import 'package:smile_and_go_app/chats/socket_service.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/dialoghelper.dart';
import 'package:smile_and_go_app/view/screen/ChatScreen/chatPages/SingleImageView.dart';
import 'package:smile_and_go_app/view/screen/ChatScreen/chatPages/model/message_model/message_helper.dart';

class ChatScreen extends StatefulWidget {
  final String name, image, doctorId;
  const ChatScreen(
      {Key? key,
      required this.name,
      required this.image,
      required this.doctorId})
      : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController chattingcontroller = TextEditingController();
  bool chatstatus = true;
  final ScrollController _scrollController = ScrollController();

  var chatViewModel = <ChatViewModel>[];
  List<MessageModel> messages = [];
  String base64Image = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SocketService.connectAndListen();
    //creatChateRoom();
    getChatDataRoom();
  }

  // imageShow() {
  //   showGeneralDialog(
  //     context: context,
  //     barrierColor: Colors.black12.withOpacity(0.6), // Background color
  //     barrierDismissible: false,
  //     barrierLabel: 'Dialog',
  //     transitionDuration: Duration(milliseconds: 400),
  //     pageBuilder: (_, __, ___) {
  //       return Column(
  //         children: <Widget>[
  //           Expanded(
  //             flex: 5,
  //             child: SizedBox.expand(child: FlutterLogo()),
  //           ),
  //           Expanded(
  //             flex: 1,
  //             child: SizedBox.expand(
  //               child: ElevatedButton(
  //                 onPressed: () => Navigator.pop(context),
  //                 child: Text('Dismiss'),
  //               ),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // imagePreviwe(BuildContext context, String image) {
  //   showGeneralDialog(
  //     context: context,
  //     barrierColor: Colors.black12.withOpacity(0.6), // Background color
  //     barrierDismissible: false,
  //     barrierLabel: 'Dialog',
  //     transitionDuration: Duration(milliseconds: 400),
  //     pageBuilder: (_, __, ___) {
  //       return Stack(
  //         children: <Widget>[
  //           Expanded(
  //               flex: 5,
  //               child: SizedBox.expand(
  //                 child: Image(
  //                     image: FileImage(File(image.toString())),
  //                     fit: BoxFit.cover),
  //               )),
  //           Positioned(
  //             left: 0.0,
  //             bottom: 30.0,
  //             child: Text("kdfgh"),
  //             // child: InkWell(
  //             //   child: CircleAvatar(
  //             //     radius: 20,
  //             //     child: Icon(
  //             //       Icons.send,
  //             //       size: 30,
  //             //     ),
  //             //   ),
  //             //   onTap: () {},
  //             // ),
  //           ),
  //           // Expanded(
  //           //   flex: 1,
  //           //   child: SizedBox(
  //           //       height: 30,
  //           //       child: Row(
  //           //         crossAxisAlignment: CrossAxisAlignment.end,
  //           //         mainAxisAlignment: MainAxisAlignment.end,
  //           //         children: [Text("data")],
  //           //       )),
  //           // ),
  //         ],
  //       );
  //     },
  //   );

  //   // return showDialog(
  //   //     context: context,
  //   //     builder: (context) => SimpleDialog(
  //   //           shape: RoundedRectangleBorder(
  //   //               borderRadius: BorderRadius.all(Radius.circular(4.0))),
  //   //           backgroundColor:
  //   //               Theme.of(context).dialogBackgroundColor.withOpacity(0.9),
  //   //           children: [
  //   //             Container(
  //   //               height: 50.h,
  //   //               width: MediaQuery.of(context).size.width.w,
  //   //               decoration: BoxDecoration(
  //   //                 //   borderRadius: BorderRadius.circular(60),
  //   //                 border: Border.all(),
  //   //                 image: DecorationImage(
  //   //                     image: FileImage(File(image.toString())),
  //   //                     fit: BoxFit.cover),
  //   //               ),
  //   //             ),
  //   //             InkWell(
  //   //               child: const CircleAvatar(
  //   //                 radius: 20,
  //   //                 child: Icon(
  //   //                   Icons.send,
  //   //                   size: 30,
  //   //                 ),
  //   //               ),
  //   //               onTap: () {
  //   //                 _scrollController.animateTo(
  //   //                     _scrollController.position.maxScrollExtent,
  //   //                     duration: Duration(milliseconds: 300),
  //   //                     curve: Curves.easeOut);
  //   //                 setState(() {
  //   //                   SocketService.sendMessage(chattingcontroller.text,
  //   //                       widget.doctorId.toString(), "");
  //   //                   setMessage("source", chattingcontroller.text, "1");

  //   //                   chatstatus = false;
  //   //                   chattingcontroller.clear();
  //   //                   chattingcontroller.text = '';
  //   //                 });
  //   //               },
  //   //             ),
  //   //           ],
  //   //         ));
  // }

  showOptionDailog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
              backgroundColor:
                  Theme.of(context).dialogBackgroundColor.withOpacity(0.9),
              children: [
                SimpleDialogOption(
                  onPressed: () async {
                    final ImagePicker _picker = ImagePicker();
                    try {
                      final XFile? image = await _picker.pickImage(
                          source: ImageSource.camera, imageQuality: 60);
                      if (image != null) {
                        File imageFile = File(image.path);
                        List<int> imageBytes = imageFile.readAsBytesSync();
                        base64Image = base64Encode(imageBytes);
                        if (base64Image.isNotEmpty) {
                          SocketService.sendMessage(chattingcontroller.text,
                              widget.doctorId.toString(), base64Image);

                          setState(() {
                            setMessage(
                                "source",
                                null,
                                "1",
                                base64Image,
                                DateTime.now()
                                    .toString()
                                    .substring(10, 16)
                                    .toString());
                            Navigator.of(context).pop();
                          });
                        }
                      }
                    } on Exception catch (e) {
                      print("cxjkbjvkbsdjv" + e.toString());
                    }
                  },
                  child: Row(
                    children: [
                      Icon(Icons.camera),
                      Text(
                        "   Camera",
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.clear),
                      Text(
                        "  Cancel",
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
              ],
            ));
  }

  _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;

    print(result.files.first.name);
    print(result.files.first.size);
    print(result.files.first.path);
  }

  chooseImgageGa(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
              backgroundColor:
                  Theme.of(context).dialogBackgroundColor.withOpacity(0.9),
              children: [
                SimpleDialogOption(
                  onPressed: () async {
                    final ImagePicker _picker = ImagePicker();
                    try {
                      final XFile? image = await _picker.pickImage(
                          source: ImageSource.gallery, imageQuality: 60);
                      if (image != null) {
                        File imageFile = File(image.path);
                        List<int> imageBytes = imageFile.readAsBytesSync();
                        base64Image = base64Encode(imageBytes);

                        if (base64Image.isNotEmpty) {
                          setState(() {
                            SocketService.sendMessage(chattingcontroller.text,
                                widget.doctorId.toString(), base64Image);
                            setMessage(
                                "source",
                                null,
                                "1",
                                base64Image,
                                DateTime.now()
                                    .toString()
                                    .substring(10, 16)
                                    .toString());
                            Navigator.of(context).pop();
                          });
                        }
                        print("cxjkbjvkbsdjv" + base64Image);
                      }
                    } on Exception catch (e) {
                      print("cxjkbjvkbsdjv" + e.toString());
                    }
                  },
                  child: Row(
                    children: [
                      Icon(Icons.image),
                      Text(
                        "   Gallery",
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.clear),
                      Text(
                        "  Cancel",
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
              ],
            ));
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
      //chatRomId = response["data"]["id"].toString();
    } else {
      DialogHelper.showFlutterToast(strMsg: "Something went wrong !");
    }
  }

  Future getChatDataRoom() async {
    var data = {
      "doctorId": widget.doctorId.toString(),
    };

    chatsapi responsedata = chatsapi(data);

    final response = await responsedata.getallChat(widget.doctorId.toString());

    if (response['status'] == "success") {
      ChatDetailsModel chatDetailsModel = ChatDetailsModel.fromJson(response);

      if (chatDetailsModel.data != null) {
        if (chatDetailsModel.data!.isNotEmpty) {
          for (int i = 0; i < chatDetailsModel.data!.length; i++) {
            if (chatDetailsModel.data![i].message == null) {
              print(
                  "kdjghkjd   " + chatDetailsModel.data![i].message.toString());
            } else {
              print(
                  "dkfghkfh  " + chatDetailsModel.data![i].message.toString());
            }

            setState(() {
              setMessage(
                  chatDetailsModel.data![i].autherDetail!.userType.toString(),
                  chatDetailsModel.data![i].message,
                  chatDetailsModel.data![i].id.toString(),
                  chatDetailsModel.data![i].file.toString(),
                  chatDetailsModel.data![i].createdAt.toString());
            });
          }
        }
      }
    } else {}
  }

  void setMessage(
      String type, var message, String chatId, String img, String time) {
    // _scrollController.animateTo(_scrollController.position.maxScrollExtent,
    //     duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    print("dfkghd" + img);
    MessageModel messageModel = MessageModel(
        type: type, message: message, time: time, chatId: chatId, img: img);
    print(messages);
    messages.add(messageModel);
  }

  @override
  Widget build(BuildContext context) {
    print("length " + messages.length.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondrycolors,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(APIURL.imageurl + widget.image),
            ),
            SizedBox(
              width: 5,
            ),
            Text(widget.name)
          ],
        ),
        actions: const [
          InkWell(child: Icon(Icons.call)),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.video_call_outlined),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: StreamBuilder(
                stream: SocketService.getResponse,
                builder: (BuildContext context,
                    AsyncSnapshot<ChatViewModel> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Expanded(
                        child: ListView.builder(
                            controller: _scrollController,
                            physics: BouncingScrollPhysics(),
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: index % 2 == 0
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  MessageBubble(
                                    index: index,
                                    message: messages[index].message,
                                    isSeen: false,
                                    isMe: false,
                                    time: messages[index].time.toString(),
                                    onPress: () {},
                                    listLength: MessageHelper.itemCount,
                                    type: messages[index].type.toString(),
                                    img: messages[index].img,
                                  )
                                ],
                              );
                            }));
                  } else if (snapshot.connectionState ==
                          ConnectionState.active ||
                      snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else if (snapshot.hasData) {
                      setMessage(
                          "Dentist",
                          snapshot.data!.message.toString(),
                          snapshot.data!.id.toString(),
                          snapshot.data!.file.toString(),
                          snapshot.data!.createdAt.toString());

                      return Expanded(
                          child: ListView.builder(
                              controller: _scrollController,
                              physics: BouncingScrollPhysics(),
                              itemCount: messages.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: index % 2 == 0
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
                                  children: [
                                    MessageBubble(
                                        index: index,
                                        message: messages[index].message,
                                        isSeen: false,
                                        isMe: false,
                                        time: messages[index].time.toString(),
                                        onPress: () {},
                                        listLength: MessageHelper.itemCount,
                                        type: messages[index].type.toString(),
                                        img: messages[index].img)
                                  ],
                                );
                              }));

                      //chatViewModel.add(snapshot.data!);
                    }
                  } else {
                    return Text("Somthing went wrong");
                  }

                  return Container(
                    child: Text("Hiiiiiii"),
                  );
                },
              ),
            ),

            // Expanded(
            //     child: ListView.builder(
            //      itemCount: MessageHelper.itemCount,
            //      itemBuilder: (context, index) {
            //        MessageItemModel chatItem =
            //            MessageHelper.getCHatList(index);
            //        return Column(
            //          crossAxisAlignment: index % 2 == 0
            //              ? CrossAxisAlignment.end
            //              : CrossAxisAlignment.start,
            //          children: [
            //            MessageBubble(
            //              index: index,
            //              message: chatItem.mostRecentMessage,
            //              isSeen: false,
            //              isMe: false,
            //              time: chatItem.messageDate,
            //              onPress: () {},
            //              listLength: MessageHelper.itemCount,
            //              type: chatItem.type,
            //            )
            //          ],
            //        );
            //      })),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade100),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: chattingcontroller,
                                  onChanged: (value) {
                                    // setState(() {
                                    //   chatstatus = true;
                                    // });
                                  },
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xff9C9EB9)),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 0.0),
                                    hintText: 'Message...',
                                    hintStyle: TextStyle(
                                      color: Color(0xff8E8E93),
                                    ),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (builder) => bottomSheet());
                                  },
                                  child: Icon(Icons.attach_file)),
                              SizedBox(
                                width: 2.w,
                              ),
                              InkWell(
                                  onTap: () {
                                    showOptionDailog(context);
                                  },
                                  child: Icon(Icons.camera_alt)),
                              SizedBox(
                                width: 2.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // chatstatus == false
                  //     ? const CircleAvatar(
                  //         radius: 20,
                  //         child: Icon(
                  //           Icons.mic,
                  //           size: 19,
                  //           color: Colors.white,
                  //         ),
                  //       )
                  //     :
                  InkWell(
                    child: const CircleAvatar(
                      radius: 20,
                      child: Icon(
                        Icons.send,
                        size: 30,
                      ),
                    ),
                    onTap: () {
                      _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeOut);
                      setState(() {
                        SocketService.sendMessage(chattingcontroller.text,
                            widget.doctorId.toString(), "");
                        setMessage("source", chattingcontroller.text, "1", "",
                            DateTime.now().toString().substring(10, 16));

                        chatstatus = false;
                        chattingcontroller.clear();
                        chattingcontroller.text = '';
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     iconCreation(Icons.headset, Colors.orange, "Audio"),
              //     SizedBox(
              //       width: 40,
              //     ),
              //     iconCreation(Icons.location_pin, Colors.teal, "Location"),
              //     SizedBox(
              //       width: 40,
              //     ),
              //     iconCreation(Icons.person, Colors.blue, "Contact"),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icons, Color color, String text) {
    return InkWell(
      onTap: () async {
        setState(() {
          if (text == "Camera") {
            showOptionDailog(context);
          } else if (text == "Gallery") {
            Navigator.of(context).pop();
            chooseImgageGa(context);
          } else {
            _pickFile();
          }
        });
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icons,
              // semanticLabel: "Help",
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              // fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({
    required this.isMe,
    required this.message,
    required this.time,
    required this.onPress,
    required this.index,
    required this.listLength,
    required this.isSeen,
    required this.type,
    required this.img,
  });

  final bool isMe;
  var message;
  String type;
  final String time;
  final VoidCallback onPress;
  int index;
  int listLength;
  bool isSeen;
  var img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: type == "Dentist"
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 2,
          ),

          Align(
            alignment: type == "Dentist"
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: InkWell(
              onTap: onPress,
              child: Material(
                  elevation: 1,
                  color: type == "Dentist"
                      ? Colors.teal
                      : Colors.black.withOpacity(0.5),
                  borderRadius: index % 2 == 0
                      ? BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(10))
                      : BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(0)),
                  child: message != null
                      ? Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          child: Text(
                            message,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 12, color: Colors.white),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SingleImageView(img.toString())),
                            );
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.memory(base64.decode(img.toString()),
                                  width: MediaQuery.of(context).size.width * .5,
                                  height:
                                      MediaQuery.of(context).size.height * .2,
                                  fit: BoxFit.cover)),
                        )),
            ),
          ),

          // Align(
          //   alignment: type == "Dentist"
          //       ? Alignment.centerLeft
          //       : Alignment.centerRight,
          //   child: InkWell(
          //     onTap: onPress,
          //     child: Material(
          //       elevation: 1,
          //       borderRadius: index % 2 == 0
          //           ? BorderRadius.only(
          //               topLeft: Radius.circular(10.0),
          //               bottomLeft: Radius.circular(0),
          //               bottomRight: Radius.circular(10))
          //           : BorderRadius.only(
          //               topRight: Radius.circular(10.0),
          //               bottomLeft: Radius.circular(10),
          //               bottomRight: Radius.circular(0)),
          //       color: index % 2 == 0
          //           ? Colors.teal
          //           : Colors.black.withOpacity(0.5),
          //       child: Padding(
          //           padding: const EdgeInsets.all(5.0),
          //           child: Image.memory(base64.decode(img.toString()),
          //               width: MediaQuery.of(context).size.width * .5,
          //               height: MediaQuery.of(context).size.height * .2,
          //               fit: BoxFit.cover)),
          //     ),
          //   ),
          // ),

          SizedBox(
            height: 2,
          ),
          Text(
            time.toString(),
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }
}
