import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/api/network.dart';

class chatsapi {
  final Map<String, dynamic> body;
  chatsapi(this.body);

  Future createchatRoom() async {
    ServiceWithHeaderWithbody service =
        ServiceWithHeaderWithbody(APIURL.createchatRoom, body);
    var data = await service.postdatawithoutbody();
    return data;
  }
  Future getallChat(String chatRoomId) async {
    print("chatId" + chatRoomId);
    ServiceWithHeader service = ServiceWithHeader(APIURL.getChat + chatRoomId);
    var data = await service.data();
    print("datas");

    print(data);
    return data;
  }

  Future deleteChat(String chatId) async {
    print("chatId" + chatId);
    ServiceWithDelete service =
        ServiceWithDelete(APIURL.deleteChatByChatId + chatId);
    var data = await service.data();
    print("datas");

    print(data);
    return data;
  }

  //reschedul_bookings
}
