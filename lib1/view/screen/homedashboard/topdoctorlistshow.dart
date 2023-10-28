import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/api/apphelper.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/model/todoctorslistModel.dart';
import 'package:smile_and_go_app/provider/dashboard_Provider.dart';
import 'package:smile_and_go_app/utils/appbarforall.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/loaderscreennew.dart';
import 'package:smile_and_go_app/utils/nodatafounerror.dart';
import 'package:smile_and_go_app/view/screen/homedashboard/components/topdoctorcardui.dart';

class TopDoctorScreenActivity extends StatefulWidget {
  final String locationId;
  const TopDoctorScreenActivity({super.key, required this.locationId});

  @override
  State<TopDoctorScreenActivity> createState() =>
      _TopDoctorScreenActivityState();
}

class _TopDoctorScreenActivityState extends State<TopDoctorScreenActivity> {
  DashBoradProvider _dashBoradProvider = DashBoradProvider();

  @override
  void initState() {
    _dashBoradProvider = Provider.of<DashBoradProvider>(context, listen: false);
    getalldata();

    super.initState();
  }

  getalldata() async {
    await _dashBoradProvider.doctorlistbyLocationId(widget.locationId);
  }

  bool searchshow = false;
  TextEditingController sercheditcontroler = TextEditingController();
  String searchString = '';
  List<TopdoctorslistData> bottomlist = [];
  bool datashow = false;
  Future fetchdata() async {
    bottomlist = [];
    print(searchString);
    for (int i = 0; i < _dashBoradProvider.doctorList.length; i++) {
      if (_dashBoradProvider.doctorList[i].firstName!
          .toLowerCase()
          .contains(searchString.toLowerCase())) {
        bottomlist.add(_dashBoradProvider.doctorList[i]);
      }
    }

    datashow = true;
    return bottomlist;
  }

  @override
  Widget build(BuildContext context) {
    print("locationId" + widget.locationId);
    return Consumer<DashBoradProvider>(
        builder: (context, dashBoradProvider, child) {
      return FutureBuilder(
          future: fetchdata(),
          builder: (context, snapshot) {
            if (!dashBoradProvider.datanotfound)
              SizedBox(height: 80.h, child: Center(child: LoaderScreennew()));

            return Scaffold(
                appBar: AppBar(
                  title: searchshow
                      ? Container(
                          width: double.infinity,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: AppColors.secondrycolors, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: TextField(
                                controller: sercheditcontroler,
                                onChanged: ((value) {
                                  setState(() {
                                    searchString = sercheditcontroler.text;
                                  });
                                }),
                                decoration: InputDecoration(
                                    isDense: true,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.clear,
                                        color: AppColors.colorgrey,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          searchshow = false;
                                          sercheditcontroler.clear();
                                          searchString = '';
                                        });
                                      },
                                    ),
                                    hintText: Languages.of(context)!.search,
                                    hintStyle: AppStyles.onboardsubtitle
                                        .copyWith(fontSize: 14.sp),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        )
                      : Text(
                          Languages.of(context)!.topdoctors,
                          style:
                              AppStyles.onboardtitle.copyWith(fontSize: 18.sp),
                        ),
                  leading: InkWell(
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.blackColor,
                    ),
                    onTap: () {
                      // Navigator.pushNamed(context, Routes.favoriteDoctorList);
                      Navigator.pop(context);
                    },
                  ),
                  automaticallyImplyLeading: false,
                  actions: [
                    if (!searchshow)
                      IconButton(
                        onPressed: () {
                          setState(() {
                            searchshow = true;
                          });
                        },
                        icon: const Icon(
                          Icons.search,
                          color: AppColors.blackColor,
                        ),
                      ),
                  ],
                  centerTitle: true,
                  elevation: 0,
                  backgroundColor: AppColors.colorswhite,
                ),
                body: Padding(
                  padding: EdgeInsets.only(
                      top: 0.5.h, bottom: 2.h, left: 3.w, right: 3.w),
                  child: dashBoradProvider.doctorListModel.data != null
                      ? bottomlist.isEmpty
                          ? NoDataFoundErrorScreens(
                              height: 50.h,
                              title: Languages.of(context)!.nodatafound,
                            )
                          : TopDoctorsScreenActivityCard(
                              doctorlistdata: bottomlist,
                              type: "doctorlisttype",
                              searchString: '',
                            )
                      : Container(),
                ));
          });
    });
  }
}
