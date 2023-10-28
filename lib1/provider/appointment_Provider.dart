import 'package:flutter/foundation.dart';
import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/api/network.dart';
import 'package:smile_and_go_app/model/DoctorAvailabilityModel.dart';
import 'package:smile_and_go_app/model/homebannerModel.dart';

class AppointmentServices extends ChangeNotifier {

  bool datanotfound = false;
  DoctorAvailabilityModel doctorAvailabilityModel = DoctorAvailabilityModel();
  
  List<AvailabilityDate> availabilityDatesData = [];
  List<AvailabilityDate> get abavailabilityDates => availabilityDatesData;

  Future doctor_availability(
      int doctorId, String startDate, String endDate, String locationId) async {
    {
      print("dhgfhjghfhgkj");
      datanotfound = false;
      var url = APIURL.doctor_availability +
          '?startDate=${startDate}&endDate=${endDate}&doctorId=${doctorId}';
      ServiceWithHeader service =  ServiceWithHeader(url);
      final response = await service.data_check_avilability();
      print("availabledata");
      print(response);
      doctorAvailabilityModel = DoctorAvailabilityModel.fromJson(response);
      availabilityDatesData = [];
      if (doctorAvailabilityModel.availabilityDates != null) {
        if (doctorAvailabilityModel.availabilityDates!.isNotEmpty) {
          for (int i = 0;
              i < doctorAvailabilityModel.availabilityDates!.length;
              i++) {
            print("hello");
            availabilityDatesData
                .add(doctorAvailabilityModel.availabilityDates![i]);

            print("length" + availabilityDatesData.length.toString());
          }
        }
      }
      datanotfound = true;
      notifyListeners();
      return;
    }
  }
}
