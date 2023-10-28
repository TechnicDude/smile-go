import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/api/network.dart';

class deletechat {
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
