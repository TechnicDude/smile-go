import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/api/apphelper.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/utils/app_string.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/changelanguagepopup.dart';
import 'package:smile_and_go_app/utils/settingswidgetui.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreenActivity extends StatefulWidget {
  const SettingScreenActivity({super.key});

  @override
  State<SettingScreenActivity> createState() => _SettingScreenActivityState();
}

class _SettingScreenActivityState extends State<SettingScreenActivity> {
  bool showpop = false;
  bool light = true;
  bool notificationval = true;
  final Uri _url = Uri.parse(APIURL.playstoreurl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorswhite,
      appBar: AppBar(
        backgroundColor: AppColors.colorswhite,
        iconTheme: IconThemeData(
          color: AppColors.blackColor,
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          Languages.of(context)!.settings,
          style: AppStyles.onboardtitle.copyWith(fontSize: 18.sp),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 20.h,
            color: AppColors.colorswhite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // CircleAvatar(
                //   radius: 5.5.h,
                //   backgroundColor: AppColors.colorswhite,
                //   child: CircleAvatar(
                //     radius: 5.h,
                //     backgroundColor: Colors.grey.withOpacity(0.3),
                //     child: GestureDetector(
                //       onTap: () {},
                //       child: CircleAvatar(
                //           backgroundColor: Colors.grey,
                //           radius: 4.5.h,
                //           backgroundImage: AssetImage(
                //             AppImages.onboardingsec,
                //           )),
                //     ),
                //   ),
                // ),
                CircleAvatar(
                  radius: 6.h,
                  backgroundColor: AppColors.colorgrey.withOpacity(0.3),
                  child: CircleAvatar(
                    radius: 5.5.h,
                    backgroundColor: AppColors.colorgrey,
                    backgroundImage: AppHelper.userAvatar != null
                        ? NetworkImage(APIURL.imageurl + AppHelper.userAvatar!)
                        : AssetImage(
                            AppImages.profile,
                          ) as ImageProvider,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.profileScreenActivity);
                        },
                        child: CircleAvatar(
                          radius: 1.7.h,
                          backgroundColor:
                              AppColors.blackColor.withOpacity(0.5),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 2.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 0.5.h,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    '${AppHelper.firstName}',
                    //   "Dr. Deepika",
                    style: AppStyles.onboardtitle.copyWith(
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(
                    '${AppHelper.lastName}',
                    style: AppStyles.onboardtitle.copyWith(
                      fontSize: 15.sp,
                    ),
                  ),
                ]),
                SizedBox(
                  height: 0.5.h,
                ),

                Text(
                  '${AppHelper.email_VALUE}',
                  //  "+91 9876543210", // "deepika@imperialit.in",
                  style: AppStyles.onboardsubtitle.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                // Text(
                //   '${AppHelper.phoneNumber}',
                //   //  "+91 9876543210", // "deepika@imperialit.in",
                //   style: AppStyles.onboardsubtitle.copyWith(
                //     fontSize: 14.sp,
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.colorswhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(1, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: ListView(
                  children: [
                    Settingwidgetui(
                      icon: Icons.language,
                      title: Languages.of(context)!.changelanguage,
                      onTap: () {
                        setState(() {
                          showpop = true;
                        });
                      },
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                    Settingwidgetui(
                      icon: Icons.perm_phone_msg_outlined,
                      title: Languages.of(context)!.contactus,
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.webviewWidgetUIScreen,
                            arguments: {
                              AppStringFile.title:
                                  Languages.of(context)!.contactus,
                              AppStringFile.url: APIURL.contactus,
                            });
                      },
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                    Settingwidgetui(
                      icon: Icons.supervised_user_circle_rounded,
                      title: Languages.of(context)!.aboutus,
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.webviewWidgetUIScreen,
                            arguments: {
                              AppStringFile.title:
                                  Languages.of(context)!.aboutus,
                              AppStringFile.url: APIURL.aboutus,
                            });
                      },
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                    Settingwidgetui(
                      icon: Icons.privacy_tip,
                      title: Languages.of(context)!.privacypolicy,
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.webviewWidgetUIScreen,
                            arguments: {
                              AppStringFile.title:
                                  Languages.of(context)!.privacypolicy,
                              AppStringFile.url: APIURL.privacypolicy,
                            });
                      },
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                    Settingwidgetui(
                        icon: Icons.lock_reset,
                        title: Languages.of(context)!.termsandcondition,
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.webviewWidgetUIScreen,
                              arguments: {
                                AppStringFile.title:
                                    Languages.of(context)!.termsandcondition,
                                AppStringFile.url: APIURL.termsandcondition,
                              });
                        }),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                    Settingwidgetui(
                      icon: Icons.share,
                      title: Languages.of(context)!.shareapp,
                      onTap: () {
                        Share.share(
                            'hey! check out SmileandGo ${APIURL.shareapp}');
                      },
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                    Settingwidgetui(
                      icon: Icons.star,
                      title: Languages.of(context)!.rateapp,
                      onTap: _launchUrl,
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                    Settingwidgetui(
                      icon: Icons.delete_sweep,
                      title: Languages.of(context)!.deleteaccount,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text(
                              Languages.of(context)!.deleteaccount,
                              style: AppStyles.onboardtitle
                                  .copyWith(fontSize: 18.sp),
                            ),
                            content: Text(
                                Languages.of(context)!.deleteaccountmsg,
                                style: AppStyles.onboardsubtitle
                                    .copyWith(fontSize: 16.sp)),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Text(Languages.of(context)!.no,
                                    style: AppStyles.onboardsubtitle
                                        .copyWith(fontSize: 17.sp)),
                              ),
                              TextButton(
                                onPressed: () async {
                                  // open this comment when needs
                                  // setState(() {
                                  //   error = '';
                                  // });
                                  // if (isLoading) {
                                  //   return;
                                  // }
                                  // deleteAccount(
                                  //     profileUserProvider
                                  //         .profileuserList[0]
                                  //         .id
                                  //         .toString(),
                                  //     context);
                                },
                                child: Text(Languages.of(context)!.yes,
                                    style: AppStyles.onboardsubtitle
                                        .copyWith(fontSize: 17.sp)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                    Settingwidgetui(
                      icon: Icons.logout,
                      title: Languages.of(context)!.logout,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text(Languages.of(context)!.logout,
                                style: AppStyles.onboardtitle
                                    .copyWith(fontSize: 18.sp)),
                            content: Text(Languages.of(context)!.logoutmsg,
                                style: AppStyles.onboardsubtitle
                                    .copyWith(fontSize: 16.sp)),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Text(Languages.of(context)!.no,
                                    style: AppStyles.onboardsubtitle
                                        .copyWith(fontSize: 17.sp)),
                              ),
                              TextButton(
                                onPressed: () async {
                                  AppHelper.logout();

                                  Navigator.of(context, rootNavigator: true)
                                      .pushNamedAndRemoveUntil(
                                          Routes.loginScreenActivity,
                                          (Route<dynamic> route) => false);
                                },
                                child: Text(Languages.of(context)!.yes,
                                    style: AppStyles.onboardsubtitle
                                        .copyWith(fontSize: 17.sp)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text("Smile and Go \nVersion v1.0.0",
                          style: AppStyles.onboardsubtitle
                              .copyWith(fontSize: 13.sp)),
                    ]),
                    SizedBox(
                      height: 4.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (showpop)
            Center(child: EditLanguagePopup(
              callback: (value) {
                setState(() {
                  showpop = false;
                });
              },
            )),
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
