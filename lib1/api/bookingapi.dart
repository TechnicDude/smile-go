import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/api/network.dart';

class Bookingapi {
  
  final Map<String, dynamic> body;

  Bookingapi(this.body);

  Future create_appointment() async {
    ServiceWithHeaderWithbody service =
        ServiceWithHeaderWithbody(APIURL.create_booking, body);
    var data = await service.postdatawithoutbody();
    return data;
  }

  Future cancle_appointment(String bookingId) async {
    ServiceWithHeaderWithbody service =
        ServiceWithHeaderWithbody(APIURL.cancle_bookings + bookingId, body);
    var data = await service.putdatawithoutbody();
    return data;
  }

  Future reschedul_appointment(String bookingId) async {
    ServiceWithHeaderWithbody service =
        ServiceWithHeaderWithbody(APIURL.reschedul_bookings + bookingId, body);
    var data = await service.putdatawithoutbody();
    return data;
  }

}
