import 'package:flutter/cupertino.dart';
import 'package:smile_and_go_app/api/apphelper.dart';
import 'package:smile_and_go_app/api/network.dart';
import 'package:smile_and_go_app/model/NotificationModel.dart';
import 'package:smile_and_go_app/model/PatientAppointmentList.dart';
import 'package:smile_and_go_app/model/homebannerModel.dart';
import 'package:smile_and_go_app/model/todoctorslistModel.dart';
import '../api/api.dart';

class DashBoradProvider extends ChangeNotifier {
  BannerListModel bannerListModel = BannerListModel();
  // CategoryModel categoryModel = CategoryModel();
  TopdoctorslistModel doctorListModel = TopdoctorslistModel();
  TopdoctorslistModel doctorListModelbyid = TopdoctorslistModel();
  //NotificationModel

  NotificationModel notificationModel = NotificationModel();

  List<BannerData> _bannerlist = [];
  List<BannerData> get bannerList => _bannerlist;

  // List<CategoryData> _categorylist = [];
  // // List<CategoryData> get categoryList => _categorylist;

  List<TopdoctorslistData> _doctorlist = [];
  List<TopdoctorslistData> get doctorList => _doctorlist;

  List<TopdoctorslistData> _doctorlistbyid = [];
  List<TopdoctorslistData> get doctorListbyid => _doctorlistbyid;

  bool datanotfound = false;
  bool bannerfetch = false;

  bool autherfetch = false;

  Future bannerlist() async {
    bannerfetch = false;
    ServiceWithHeader service = new ServiceWithHeader(
        APIURL.homebanner + "?language=${AppHelper.language}");
    final response = await service.data();
    bannerListModel = BannerListModel.fromJson(response);
    _bannerlist = [];
    if (bannerListModel.data != null) {
      if (bannerListModel.data!.isNotEmpty) {
        for (int i = 0; i < bannerListModel.data!.length; i++) {
          _bannerlist.add(bannerListModel.data![i]);
        }
      }
    }
    bannerfetch = true;
    notifyListeners();
    return;
  }

  // Future categorylist() async {
  //   print(AppHelper.AUTH_TOKEN_VALUE);
  //   var url = APIURL.coursecategory + "?language=${AppHelper.language}";
  //   ServiceWithHeader service = new ServiceWithHeader(url);
  //   final response = await service.datame();
  //   categoryModel = CategoryModel.fromJson(response);
  //   if (categoryModel.data != null) {
  //     if (categoryModel.data!.isNotEmpty) {
  //       _categorylist = [];
  //       for (int i = 0; i < categoryModel.data!.length; i++) {
  //         _categorylist.add(categoryModel.data![i]);
  //       }
  //     }
  //   }
  //   notifyListeners();
  //   return;
  // }

  Future doctorlist() async {
    autherfetch = false;
    ServiceWithHeader service = ServiceWithHeader(APIURL.dentists);
    // + "?language=${AppHelper.language}");

    final response = await service.data();

    doctorListModel = TopdoctorslistModel.fromJson(response);
    _doctorlist = [];
    if (doctorListModel.data != null) {
      if (doctorListModel.data!.isNotEmpty) {
        for (int i = 0; i < doctorListModel.data!.length; i++) {
          _doctorlist.add(doctorListModel.data![i]);
        }
      }
    }
    autherfetch = true;
    notifyListeners();
    return;
  }

  Future doctorlistbyLocationId(String locationId) async {
    print("dkjfhkjdfgkjkg");
    autherfetch = false;
    ServiceWithHeader service =
        ServiceWithHeader(APIURL.getLocationbyDentist + locationId);
    final response = await service.data();
    doctorListModel = TopdoctorslistModel.fromJson(response);
    _doctorlist = [];
    if (doctorListModel.data != null) {
      if (doctorListModel.data!.isNotEmpty) {
        for (int i = 0; i < doctorListModel.data!.length; i++) {
          _doctorlist.add(doctorListModel.data![i]);
        }
      }
    }
    autherfetch = true;
    notifyListeners();
    return;
  }

  Future doctorlistbyid(String doctorId) async {
    datanotfound = false;
    var url = APIURL.dentists + doctorId + "?language=${AppHelper.language}";
    ServiceWithHeader service = ServiceWithHeader(url);
    final response = await service.data();
    doctorListModelbyid = TopdoctorslistModel.fromJson(response);
    _doctorlistbyid = [];
    if (doctorListModelbyid.data != null) {
      // print(recipeModelbyid.data!.length);
      // for (int i = 0; i < autherListModelbyid.data!.length; i++) {
      //print(autherListModelbyid.data!);
      // _autherlistbyid.add(autherListModelbyid.data);
      // }
      //  }
      notifyListeners();
      return;
    }
  }

//getAll_bookings
  PatientAppointmentList patientAppointmentListModel = PatientAppointmentList();
  List<Data> _patientAppointmentListData = [];
  List<Data> get patientAppointmentList => _patientAppointmentListData;
  bool getAllBookingData = false;

  Future getAll_bookingsService(String bookingStatus) async {
    getAllBookingData = false;
    var url = APIURL.getAll_bookings + "?bookingStatus=${bookingStatus}";
    ServiceWithHeader service = ServiceWithHeader(url);

    final response = await service.data();

    print("response datattattattatttta ");
    print(response);
    patientAppointmentListModel = PatientAppointmentList.fromJson(response);

    if (patientAppointmentListModel.data != null) {
      if (patientAppointmentListModel.data!.isNotEmpty) {
        getAllBookingData = true;
        _patientAppointmentListData = [];
        for (int i = 0; i < patientAppointmentListModel.data!.length; i++) {
          print("bkljvcghlk" +
              patientAppointmentListModel.data![i].id.toString());
          _patientAppointmentListData.add(patientAppointmentListModel.data![i]);
        }
      }
    }
    getAllBookingData = true;
    notifyListeners();
    return;
  }
//notificationModel

  List<Datum> _notificationList = [];
  List<Datum> get getnotificationLisData => _notificationList;
  bool getnotificationData = false;

  Future getNotificationListApi() async {
    getnotificationData = false;
    _notificationList = [];
    var url = APIURL.getNotifications;
    ServiceWithHeader service = ServiceWithHeader(url);
    final response = await service.data();
    print("response");
    print(response);
    notificationModel = NotificationModel.fromJson(response);
    if (notificationModel.data != null) {
      if (notificationModel.data!.isNotEmpty) {
        getnotificationData = true;
        for (int i = 0; i < notificationModel.data!.length; i++) {
          _notificationList.add(notificationModel.data![i]);
        }
      }
    }
    getAllBookingData = true;
    notifyListeners();
    return;
  }
}
