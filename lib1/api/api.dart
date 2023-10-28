class APIURL {
  static const String ROOT = "http://smileandgo-api.impdevops.com";
  static const String SOCKETURL = "http://smileandgo-api.impdevops.com";
  static const String HOME = "$ROOT/api/patients";
  static const String MYHOME = "$ROOT/api";
  static const String REGISTRATION = "$HOME/signUp";
  static const String LOGIN = "$HOME/login";
  // static const String ME = "$HOME/me";
  static const String socialmediaLOGIN = "$HOME/loginwithsocialmedia";
  static const String googlesocialmediaLOGIN = "$HOME/login-with-google";
  static const String facebooksocialmediaLOGIN = "$HOME/login-with-facebook";
  static const String applesocialmediaLOGIN = "$HOME/login-with-apple";
  static const String VERIFYOTP = "$HOME/verify-otp";
  static const String registerfcmtoken = "$MYHOME/fac-token";
  static const String FORGETVERIFYOTP = "$HOME/send-otp";
  static const String FORGETPASSWORD = "$HOME/forget-password";
  static const String SETNEWPASSWORD = "$HOME/change-password";
  static const String CHANGEPASSWORD = "$HOME/change-password";
  static const String USERPROFILE = "$HOME/";
  static const String USERPROFILEUPDATE = "$MYHOME/patients/";
  static const String imageurl = "$ROOT/";
  static const String imageurls =
      "http://smileandgo-api.impdevops.com/images/dentists/";
  static const String deleteaccount = "$ROOT/api/patients/";

// home page
  static const String dentists = "$MYHOME/dentists/";
  static const String schedulings = "$MYHOME/schedulings/check-availability/";
  static const String homebanner = "$MYHOME/banners/home";
  static const String FEVBYUSER = "$MYHOME/like-fev/favorite";
  static const String DeleteFav = "$MYHOME/like-fev/favorite";

  //web url
  static const String weburl = "https://www.imperialit.in";
  static const String aboutus = "$weburl/blog";
  static const String contactus = "$weburl/blog";
  static const String privacypolicy = "$weburl/blog";
  static const String termsandcondition = "$weburl/blog";
  static const String articles = "$weburl/trending";
  static const String playstoreurl =
      "https://play.google.com/store/apps/details?id=com.facebook.katana";
  static const String shareapp =
      "https://play.google.com/store/apps/details?id=com.smileandgo.app";

  static const String doctor_availability =
      "$MYHOME/schedulings/check-availability";

  static const String create_booking = "$MYHOME/bookings";
  static const String getAll_bookings = "$MYHOME/bookings";
  static const String cancle_bookings = "$MYHOME/bookings/cancle-booking/";
  static const String reschedul_bookings =
      "$MYHOME/bookings/reschedul-booking/";

  static const String getNotifications = "$MYHOME/notifications";

  static const String createchatRoom = "$MYHOME/chats/room";

  static const String getChat = "$MYHOME/chats/room/";

  static const String deleteChatByChatId = "$MYHOME/chats/";
  static const String getLocationList = "$MYHOME/locations";
  static const String getLocationbyDentist = "$MYHOME/dentists/get-dentist/";
}
