import 'package:shared_preferences/shared_preferences.dart';
import 'package:smile_and_go_app/utils/app_string.dart';
import 'package:smile_and_go_app/api/apphelper.dart';

class LocDb {
  LocDb._internal();
  static final LocDb _db = LocDb._internal();
  factory LocDb() {
    return _db;
  }
  bool loginapp = false;

  Future<bool> isLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    AppHelper.AUTH_TOKEN_VALUE = preferences.getString(AppStringFile.authtoken);
    AppHelper.userid = preferences.getString(AppStringFile.userid);
    AppHelper.email_VALUE = preferences.getString(AppStringFile.email);
    AppHelper.role = preferences.getString(AppStringFile.role);
    AppHelper.language = preferences.getString("SelectedLanguageCode");
    AppHelper.firstName = preferences.getString(AppStringFile.name);
    AppHelper.lastName = preferences.getString(AppStringFile.lastname);
    // AppHelper.emailAddress = preferences.getString(AppStringFile.email);
    AppHelper.userAvatar = preferences.getString(AppStringFile.userAvatar);
    if (AppHelper.userid == null || AppHelper.userid == false) {
      print("object check");
      loginapp = false;
      return false;
    } else {
      loginapp = true;
      return true;
    }
  }
  
}
