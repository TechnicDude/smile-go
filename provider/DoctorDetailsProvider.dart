import 'package:flutter/foundation.dart';
import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/api/network.dart';
import 'package:smile_and_go_app/model/DoctorAvailabilityModel.dart';
import 'package:smile_and_go_app/model/DoctorDetailsModel.dart';
import 'package:smile_and_go_app/model/homebannerModel.dart';

class DoctorDetailsProvider extends ChangeNotifier {
  bool datanotfound = false;
  DoctorDetailsModel doctorDetailsModel = DoctorDetailsModel();
  Future singleDoctorDetails(String doctorId) async {
    datanotfound = false;
    ServiceWithHeader service =
        ServiceWithHeader(APIURL.dentists + "$doctorId");
    final response = await service.data();
    print("doctorId" + doctorId);
    print(response);
    doctorDetailsModel = DoctorDetailsModel.fromJson(response);
    if (doctorDetailsModel.data != null) {
      print("object" + doctorDetailsModel.data!.doctorProfiles.toString());
      datanotfound = true;
    }
    notifyListeners();
    return;
  }
}
