import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/api/apphelper.dart';
import 'package:smile_and_go_app/api/network.dart';

class Locationapi {
  Future getLocationList(
      String search, latitude, longitude, radius, filter) async {
    print(filter);
    ServiceWithHeader service = ServiceWithHeader(APIURL.getLocationList +
        "?search=$search&city=$filter&latitude=$latitude&longitude=$longitude&radius=$radius");
    var data = await service.data();
    return data;
  }

  Future getLocationListwithoutdata() async {
    ServiceWithHeader service = ServiceWithHeader(APIURL.getLocationList);
    var data = await service.data();
    return data;
  }

  //reschedul_bookings
}
