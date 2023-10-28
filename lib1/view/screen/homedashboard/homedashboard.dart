import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/api/apphelper.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/provider/dashboard_Provider.dart';
import 'package:smile_and_go_app/utils/Appiconsbutton.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/loaderscreen.dart';
import 'package:smile_and_go_app/utils/nodatafounerror.dart';
import 'package:smile_and_go_app/view/screen/TreatmentScreens/components/treatmentDays.dart';
import 'package:smile_and_go_app/view/screen/TreatmentScreens/components/treatmentdetails.dart';
import 'package:smile_and_go_app/view/screen/TreatmentScreens/components/treatmenttimerui.dart';
import 'package:smile_and_go_app/view/screen/TreatmentScreens/components/weeklysDetails.dart';
import 'package:smile_and_go_app/view/screen/homedashboard/components/hometopdoctorscard.dart';
import 'package:smile_and_go_app/view/screen/homedashboard/components/serchbarcomponents.dart';
import 'package:smile_and_go_app/view/screen/homedashboard/components/sliderscreen.dart';

class HomeDashboardSCreenActivity extends StatefulWidget {
  final Function? callback;
  const HomeDashboardSCreenActivity({super.key, this.callback});

  @override
  State<HomeDashboardSCreenActivity> createState() =>
      _HomeDashboardSCreenActivityState();
}

class _HomeDashboardSCreenActivityState
    extends State<HomeDashboardSCreenActivity> {
  DashBoradProvider _dashBoradProvider = DashBoradProvider();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _dashBoradProvider = Provider.of<DashBoradProvider>(context, listen: false);
    getalldata();
    print("userid ${AppHelper.userid}");
    print(AppHelper.userid);
    print(AppHelper.AUTH_TOKEN_VALUE);
    super.initState();
  }

  getalldata() async {
    await _dashBoradProvider.bannerlist();
    await _dashBoradProvider.doctorlist();
    await _dashBoradProvider.getAll_bookingsService("Pending");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoradProvider>(
        builder: (context, dashBoradProvider, child) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding:
                EdgeInsets.only(top: 2.h, bottom: 2.h, left: 4.w, right: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10.w,
                      width: 10.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AppHelper.userAvatar != null
                              ? NetworkImage(
                                  APIURL.imageurl + AppHelper.userAvatar!)
                              : AssetImage(
                                  AppImages.profile,
                                ) as ImageProvider,
                          //  AssetImage(AppImages.onboardingsec),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: Languages.of(context)!.good,
                            style: AppStyles.onboardtitle
                                .copyWith(fontSize: 16.sp),
                            children: <TextSpan>[
                              TextSpan(
                                text: " ${AppHelper().greeting()}",
                                style: AppStyles.onboardtitle.copyWith(
                                    fontSize: 16.sp,
                                    color: AppColors.primarycolors),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: '${AppHelper.firstName}',
                            style: AppStyles.onboardsubtitle
                                .copyWith(fontSize: 15.sp),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ",",
                                  style: AppStyles.onboardsubtitle.copyWith(
                                      fontSize: 15.sp,
                                      color: AppColors.primarycolors)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Stack(
                      alignment: Alignment.topRight,
                      clipBehavior: Clip.none,
                      children: [
                        AppIconButtonsScreenActivity(
                            icondata: Icons.notifications_none,
                            color: AppColors.primarycolors,
                            onTap: () {
                              Navigator.pushNamed(context, Routes.notification);
                            }),
                        Positioned(
                          top: 1.6,
                          left: 14,
                          child: Container(
                            height: 2.1.w,
                            width: 2.1.w,
                            decoration: BoxDecoration(
                                boxShadow: [],
                                color: Colors.red,
                                shape: BoxShape.circle),
                            // child: Center(
                            //   child: Text(
                            //     "8",
                            //     style: AppStyles.onboardsubtitle
                            //         .copyWith(fontSize: 14.sp),
                            //   ),
                            // ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.favoriteDoctorList);
                      },
                      child: Icon(
                        Icons.favorite_border,
                        color: AppColors.primarycolors,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),

                          SerchBarComponentsScreenActivity(),
                          SizedBox(
                            height: 2.h,
                          ),

                          // Container(
                          //   height: 20.h,
                          //   decoration: BoxDecoration(
                          //     shape: BoxShape.rectangle,
                          //     borderRadius: BorderRadius.all(Radius.circular(1.w)),
                          //     image: DecorationImage(
                          //         fit: BoxFit.fill,
                          //         image: AssetImage(AppImages.banner)),
                          //   ),
                          // ),
                          //    SliderScreen(),

                          if (dashBoradProvider.bannerList.isNotEmpty)
                            SliderScreen(
                                bannerdata: dashBoradProvider.bannerList),

                          // SizedBox(
                          //   height: 2.h,
                          // ),
                          // // Column(
                          // //   mainAxisAlignment: MainAxisAlignment.start,
                          // //   crossAxisAlignment: CrossAxisAlignment.start,
                          // //   children: [
                          // //     Text(
                          // //       "Doctor Speciality",
                          // //       style: AppStyles.onboardtitle
                          // //           .copyWith(fontSize: 17.sp),
                          // //     ),
                          // //     SizedBox(
                          // //       height: 1.h,
                          // //     ),
                          // //     Text(
                          // //       "Lorem ipsum dolor sit amet. Vel dolor repudiandae vel labore expedita sit dolores consequuntur ab quia culpa eum eius voluptatem aut cupiditate saepe! Qui voluptatibus nihil aut deleniti harum id alias voluptatem.",
                          // //       style: AppStyles.onboardsubtitle
                          // //           .copyWith(fontSize: 15.sp),
                          // //     ),
                          // //   ],
                          // // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     Text(
                          //       Languages.of(context)!.doctorspeciality,
                          //       style: AppStyles.onboardtitle
                          //           .copyWith(fontSize: 17.sp),
                          //     ),
                          //   ],
                          // ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                //Languages.of(context)!.doctorspeciality,
                                "Location",
                                style: AppStyles.onboardtitle
                                    .copyWith(fontSize: 17.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),

                          // Container(
                          //   height: 20.h,
                          //   decoration: BoxDecoration(
                          //     shape: BoxShape.rectangle,
                          //     borderRadius: BorderRadius.all(Radius.circular(1.w)),
                          //     image: DecorationImage(
                          //         fit: BoxFit.fill,
                          //         image: AssetImage(AppImages.banner)),
                          //   ),
                          // ),
                          //    SliderScreen(),
                          // Container(height: 250, child: mapView()),
                          // SizedBox(
                          //   height: 3.h,
                          // ),
                          // Wrap(
                          //   spacing: 40.0, // gap between adjacent chips
                          //   runSpacing: 30.0, // gap between lines
                          //   // alignment: WrapAlignment.center,
                          //   children: <Widget>[
                          //     DoctorSpecialityUICard(
                          //       icon: Icons.person_2_sharp,
                          //       title: "Treatment",
                          //     ),
                          //     DoctorSpecialityUICard(
                          //       icon: Icons.medical_services_rounded,
                          //       title: "Generals",
                          //     ),
                          //     DoctorSpecialityUICard(
                          //       icon: Icons.remove_red_eye,
                          //       title: "Opthal",
                          //     ),
                          //     DoctorSpecialityUICard(
                          //       icon: Icons.fastfood,
                          //       title: "Nutrition",
                          //     ),
                          //     DoctorSpecialityUICard(
                          //       icon: Icons.psychology,
                          //       title: "Nurologist",
                          //     ),
                          //     DoctorSpecialityUICard(
                          //       icon: Icons.supervised_user_circle,
                          //       title: "Pediatrics",
                          //     ),
                          //     DoctorSpecialityUICard(
                          //       icon: Icons.radar,
                          //       title: "Radialo ",
                          //     ),
                          //     DoctorSpecialityUICard(
                          //       icon: Icons.pending,
                          //       title: "  More...",
                          //     ),
                          //   ],
                          // ),

                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Languages.of(context)!.treatment,
                                style: AppStyles.onboardtitle
                                    .copyWith(fontSize: 17.sp),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.treatmentScreenActivity);
                                },
                                child: Container(
                                  height: 4.h,
                                  width: 15.w,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3.w)),
                                    color: AppColors.colorgreycard,
                                    border: Border.all(
                                        color: AppColors.colorgrey, width: 0.1),
                                  ),
                                  child: Center(
                                    child: Text(
                                      Languages.of(context)!.seeall,
                                      style: AppStyles.onboardbody.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.secondrycolors),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // NoDataFoundErrorScreens(
                          //   height: 45.h,
                          //   title: Languages.of(context)!.nodatafound,
                          // ),
                          
                          SizedBox(
                            height: 1.h,
                          ),
                          Column(
                            children: [
                              WeekLyDetailsScreenActivity(),
                              SizedBox(
                                height: 2.h,
                              ),
                              TreatmenttimerUiScreenActivity(
                                title: "00:38:15",
                                //  onTap: () {},
                              ),
                              Divider(),
                              SizedBox(
                                height: 2.h,
                              ),
                              Wrap(
                                spacing: 10.0,
                                runSpacing: 10.0,
                                children: [
                                  BodysDetailsScreenACtivity(
                                    title: "Today total aligner time",
                                    //Languages.of(context)!.biceps,
                                    value: 100.0,
                                    time: "3 hours a day",
                                    //  icon: AppImages.biceps,
                                  ),
                                  BodysDetailsScreenACtivity(
                                    title: "1:15:00 \nare left",
                                    value: 50.0,
                                    time: "Today",
                                    //icon: AppImages.butt,
                                  ),
                                  BodysDetailsScreenACtivity(
                                    title: "15 Days completed",
                                    value: 40.0,
                                    time: "15 Days Left",
                                    // icon: AppImages.waist,
                                  ),
                                  BodysDetailsScreenACtivity(
                                    title: "Upcomming Appointment",
                                    value: 40.0,
                                    time: "28/06/23 | 19:00 PM",
                                    // icon: AppImages.leg,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              TreatmentDaysUiScreenActivity(
                                title: "5 Days",
                                subtitle:
                                    "Lorem ipsum is a placeholder text commonly used to demon strate the visual form ",
                                title2: "Photos",
                                onTap: () {},
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),

                          Row(
                            children: [
                              Text(
                                Languages.of(context)!.topdoctors,
                                style: AppStyles.onboardtitle
                                    .copyWith(fontSize: 17.sp),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.topdoctor);
                                },
                                child: Container(
                                  height: 4.h,
                                  width: 15.w,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3.w)),
                                    color: AppColors.colorgreycard,
                                    border: Border.all(
                                        color: AppColors.colorgrey, width: 0.1),
                                  ),
                                  child: Center(
                                    child: Text(
                                      Languages.of(context)!.seeall,
                                      style: AppStyles.onboardbody.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.secondrycolors),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),

                          dashBoradProvider.doctorListModel.data != null
                              ? dashBoradProvider.datanotfound
                                  ? NoDataFoundErrorScreens(
                                      height: 50.h,
                                      title: Languages.of(context)!.nodatafound,
                                    )
                                  : HomeScreenTopDoctorsCardActivity(
                                      doctorlistdata:
                                          dashBoradProvider.doctorList,
                                      type: "doctorlisttype",
                                      searchString: '',
                                    )
                              : LoaderScreen()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
