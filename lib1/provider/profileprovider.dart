import 'package:flutter/material.dart';
import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/api/apphelper.dart';
import 'package:smile_and_go_app/api/network.dart';
import 'package:smile_and_go_app/model/profilemodel.dart';

class ProfileUserProvider extends ChangeNotifier {
  ProfileUserModel profileuserModel = ProfileUserModel();
  List<ProfileUserData> _profileuserlist = [];
  List<ProfileUserData> get profileuserList => _profileuserlist;
  bool datanotfound = false;
  Future profileuserlist(String email) async {
    print("object data");
    var url = APIURL.HOME + '/' + AppHelper.userid!;
    ServiceWithHeader _service = ServiceWithHeader(url);
    final response = await _service.data();
    print(response);
    _profileuserlist = [];
    profileuserModel = ProfileUserModel.fromJson(response);
    if (profileuserModel.data != null) {
      var profileuser = profileuserModel.data;
      _profileuserlist.add(profileuser!);
      notifyListeners();
    }
  }
}
