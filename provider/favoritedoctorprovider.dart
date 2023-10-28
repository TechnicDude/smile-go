import 'package:flutter/material.dart';
import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/api/network.dart';
import 'package:smile_and_go_app/model/favoritedoctormodel.dart';

class FavoritedoctorProvider extends ChangeNotifier {
  FovoritedoctorModel fovoritedoctorModel = FovoritedoctorModel();

  List<FovoriteData> _fovoritedoctorlist = [];
  List<FovoriteData> get fovoritedoctorList => _fovoritedoctorlist;

  bool datanotfound = false;
  Future fovoritedoctorlist() async {
    print("object data");
    // var url = APIURL.FAVORITE;
    var url = APIURL.FEVBYUSER;
    ServiceWithHeader _service = new ServiceWithHeader(url);
    final response = await _service.data();
    fovoritedoctorModel = FovoritedoctorModel.fromJson(response);
    _fovoritedoctorlist = [];
    if (fovoritedoctorModel.data != null) {
      if (fovoritedoctorModel.data!.length > 0) {
        print(fovoritedoctorModel.data!.length);

        for (int i = 0; i < fovoritedoctorModel.data!.length; i++) {
          _fovoritedoctorlist.add(fovoritedoctorModel.data![i]);
        }
      }
    }
    datanotfound = true;
    notifyListeners();
    return;
  }

}
