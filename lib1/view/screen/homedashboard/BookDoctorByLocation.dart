import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/api/apphelper.dart';
import 'package:smile_and_go_app/api/locationapi.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/model/LocationListModel.dart';
import 'package:smile_and_go_app/model/todoctorslistModel.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/provider/dashboard_Provider.dart';
import 'package:smile_and_go_app/utils/app_string.dart';
import 'package:smile_and_go_app/utils/appbarforall.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/dialoghelper.dart';
import 'package:smile_and_go_app/utils/loaderscreennew.dart';
import 'package:smile_and_go_app/utils/nodatafounerror.dart';
import 'package:smile_and_go_app/view/screen/homedashboard/Map/mapView.dart';
import 'package:smile_and_go_app/view/screen/searchScreen/components/searchdoctorcardui.dart';
import 'components/serchbarcomponents.dart';

class BookDoctorByLocation extends StatefulWidget {
  const BookDoctorByLocation({super.key});

  @override
  State<BookDoctorByLocation> createState() => _BookDoctorByLocationState();
}

class _BookDoctorByLocationState extends State<BookDoctorByLocation> {
  TextEditingController sercheditcontroler = TextEditingController();
  String searchString = '';
  late LocationListModel locationListModel;
  late LocationListModel locationListModellist;
  bool datafound = false;
  bool datafoundlist = false;
  late double lat, long;
  late String _selectedLocation;
  dynamic selectvalue;
  late BitmapDescriptor customIcon;

  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(5, 5)), 'assets/images/logo.png')
        .then((d) {
      customIcon = d;
    });
    // getLocationlist("", "", "", "", "");
    getLocationliswithoutAnyData();
    super.initState();
    getLocation();
  }

  Future<void> getLocationlist(String search, String latitude, String longitude,
      String radius, String filter) async {
    datafound = false;
    Locationapi api = Locationapi();

    final response =
        await api.getLocationList(search, latitude, longitude, radius, filter);
    if (response['status'] == "success") {
      locationListModel = LocationListModel.fromJson(response);

      datafound = true;
      setState(() {});
    } else {
      DialogHelper.showFlutterToast(strMsg: "This Slot Already booked!");
    }
  }

  Future<void> getLocationliswithoutAnyData() async {
    datafoundlist = false;
    Locationapi api = Locationapi();

    final response = await api.getLocationListwithoutdata();
    if (response['status'] == "success") {
      locationListModellist = LocationListModel.fromJson(response);
      print("dkfjghkgjg");
      print(locationListModellist.data);

      setState(() {
        datafoundlist = true;
      });
    } else {
      DialogHelper.showFlutterToast(strMsg: "This Slot Already booked!");
    }
  }

  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lat = position.latitude;
    long = position.longitude;
    getLocationlist("", lat.toString(), long.toString(), "1000", "");

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            //Languages.of(context)!.location,
            "Book Appointment",
            style: AppStyles.onboardtitle.copyWith(fontSize: 18.sp),
          ),
          leading: InkWell(
            child: Icon(
              Icons.arrow_back,
              color: AppColors.blackColor,
            ),
            onTap: () {
              Navigator.pushNamed(context, Routes.dashBoardScreenActivity);
              //Navigator.pop(context);
            },
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.colorswhite,
        ),
        body: Padding(
          padding:
              EdgeInsets.only(top: 0.h, bottom: 1.h, left: 1.w, right: 1.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      
                      // TextField(
                      //   controller: sercheditcontroler,
                      //   onChanged: ((value) {
                      //     setState(() {
                      //       searchString = sercheditcontroler.text;
                      //     });
                      //   }),
                      //   cursorColor: AppColors.primarycolors,
                      //   decoration: InputDecoration(
                      //     contentPadding:
                      //         EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                      //     focusedBorder: OutlineInputBorder(
                      //         borderSide:
                      //             BorderSide(color: AppColors.colorgreydark),
                      //         borderRadius: BorderRadius.all(
                      //           Radius.circular(2.w),
                      //         )),
                      //     enabledBorder: OutlineInputBorder(
                      //         borderSide:
                      //             BorderSide(color: AppColors.colorgreydark),
                      //         borderRadius: BorderRadius.all(
                      //           Radius.circular(2.w),
                      //         )),
                      //     border: OutlineInputBorder(
                      //         borderSide:
                      //             BorderSide(color: AppColors.colorgreydark),
                      //         borderRadius: BorderRadius.all(
                      //           Radius.circular(2.w),
                      //         )),
                      //     suffixIcon: IconButton(
                      //       icon: Icon(Icons.search),
                      //       color: AppColors.primarycolors,
                      //       onPressed: () {
                      //         setState(() {
                      //           getLocationlist(
                      //               sercheditcontroler.text.toString(), "", "", "");
                      //           if (locationListModel.data!.isNotEmpty) {
                      //             sercheditcontroler.clear();
                      //             searchString = '';
                      //           }
                      //         });
                      //       },
                      //     ),
                      //     hintText: 'Search your doctor ...',
                      //     hintStyle: AppStyles.onboardbody
                      //         .copyWith(color: AppColors.colorgrey),
                      //   ),
                      // ),

                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 45.w,
                              padding: EdgeInsets.only(top: 4),
                              child: TextField(
                                controller: sercheditcontroler,
                                onChanged: ((value) {
                                  setState(() {
                                    searchString = sercheditcontroler.text;
                                  });
                                }),
                                cursorColor: AppColors.primarycolors,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      15.0, 10.0, 15.0, 10.0),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.colorgreydark),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(2.w),
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.colorgreydark),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(2.w),
                                      )),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.colorgreydark),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(2.w),
                                      )),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.search),
                                    color: AppColors.primarycolors,
                                    onPressed: () {
                                      setState(() {
                                        getLocationlist(
                                            sercheditcontroler.text.toString(),
                                            lat.toString(),
                                            long.toString(),
                                            "",
                                            "");
                                        if (locationListModel.data != null) {
                                          sercheditcontroler.clear();
                                          searchString = '';
                                        }
                                      });
                                    },
                                  ),
                                  hintText: 'Search by location ...',
                                  hintStyle: AppStyles.onboardbody
                                      .copyWith(color: AppColors.colorgrey),
                                ),
                              ),
                            ),
                            Spacer(),
                            datafoundlist
                                ? Container(
                                    width: 45.w,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5)),
                                          side: BorderSide(
                                              width: 1, color: Colors.grey)),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 20),
                                        child: locationListModellist
                                                .data!.isNotEmpty
                                            ? DropdownButton(
                                                value: selectvalue,
                                                isExpanded: true,
                                                underline: Container(
                                                  height: 0,
                                                  decoration:
                                                      const BoxDecoration(
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        color: Colors.white,
                                                        width: 0.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColors
                                                        .primarycolors),
                                                items: locationListModellist
                                                    .data!
                                                    .map((Data items) {
                                                  return DropdownMenuItem(
                                                    value: items,
                                                    child: Text(
                                                      " " +
                                                          items.city.toString(),
                                                    ),
                                                  );
                                                }).toList(),
                                                hint: Text(
                                                  "Select Location",
                                                  style: AppStyles.onboardbody
                                                      .copyWith(
                                                          color: AppColors
                                                              .colorgrey),
                                                ),
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    selectvalue = newValue;
                                                    getLocationlist(
                                                        "",
                                                        lat.toString(),
                                                        long.toString(),
                                                        "",
                                                        selectvalue.city
                                                            .toString());
                                                    print("djgdj");
                                                    print(selectvalue.city);
                                                  });
                                                },
                                              )
                                            : const Center(),
                                      ),
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      datafound
                          ? locationListModel.data!.isNotEmpty
                              ? Container(
                                  height: MediaQuery.of(context).size.height,
                                  child: mapView(
                                    locationListModel: locationListModel,
                                    customIcon: customIcon,
                                    lat: lat,
                                    long: long,
                                  ))
                              : NoDataFoundErrorScreens(
                                  title: Languages.of(context)!.nodatafound,
                                )
                          : SizedBox(
                              height: 80.h,
                              child: Center(child: LoaderScreennew())),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
