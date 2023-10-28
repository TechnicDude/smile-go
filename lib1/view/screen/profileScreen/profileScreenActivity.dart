import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/api/apphelper.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/provider/profileprovider.dart';
import 'package:smile_and_go_app/utils/app_string.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/changelanguagepopup.dart';
import 'package:smile_and_go_app/utils/settingswidgetui.dart';
import 'package:smile_and_go_app/view/screen/ArticleScreens/ArticleScreensActivity.dart';

class ProfileScreenActivity extends StatefulWidget {
  const ProfileScreenActivity({super.key});

  @override
  State<ProfileScreenActivity> createState() => _ProfileScreenActivityState();
}

class _ProfileScreenActivityState extends State<ProfileScreenActivity> {
  ProfileUserProvider _profileuserProvider = ProfileUserProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _profileuserProvider =
        Provider.of<ProfileUserProvider>(context, listen: false);
    _profileuserProvider.profileuserlist(AppHelper.userid ?? '');
  }

  bool showpop = false;
  bool light = true;
  bool isLoading = false;

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
        title: Text(
          Languages.of(context)!.profile,
          style: AppStyles.onboardtitle.copyWith(fontSize: 18.sp),
        ),
      ),
      body: Consumer<ProfileUserProvider>(
        builder: (context, profileUserProvider, child) {
          return Stack(
            children: [
              Container(
                height: 8.h,
                color: AppColors.colorswhite,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.h),
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
                        Padding(
                            padding: EdgeInsets.only(bottom: 1.h),
                            child: profileUserProvider
                                    .profileuserList.isNotEmpty
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 60,
                                        padding: EdgeInsets.only(left: 35.w),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              //width: 40.w,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    profileUserProvider
                                                            .profileuserList
                                                            .isNotEmpty
                                                        ? profileUserProvider
                                                                .profileuserList[
                                                                    0]
                                                                .firstName ??
                                                            ''
                                                        : '',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: AppStyles
                                                        .onboardtitle
                                                        .copyWith(
                                                      fontSize: 15.sp,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 1.w,
                                                  ),
                                                  SizedBox(
                                                    // width: 14.w,
                                                    child: Text(
                                                      profileUserProvider
                                                              .profileuserList
                                                              .isNotEmpty
                                                          ? profileUserProvider
                                                                  .profileuserList[
                                                                      0]
                                                                  .lastName ??
                                                              ' '
                                                          : '',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: AppStyles
                                                          .onboardtitle
                                                          .copyWith(
                                                        fontSize: 15.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              profileUserProvider
                                                      .profileuserList
                                                      .isNotEmpty
                                                  ? profileUserProvider
                                                      .profileuserList[0]
                                                      .phoneNumber
                                                      .toString()
                                                  : '',
                                              style: AppStyles.onboardsubtitle
                                                  .copyWith(
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 33.w,
                                              child: Text(
                                                profileUserProvider
                                                        .profileuserList
                                                        .isNotEmpty
                                                    ? profileUserProvider
                                                            .profileuserList[0]
                                                            .emailAddress ??
                                                        ''
                                                    : '',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: AppStyles.onboardsubtitle
                                                    .copyWith(
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Container()),
                        SizedBox(
                          height: 2.h,
                        ),
                        const Divider(
                          color: Colors.black12,
                          thickness: 1,
                        ),
                        Settingwidgetui(
                          icon: Icons.person,
                          title: Languages.of(context)!.editprofile,
                          onTap: () {
                            Navigator.pushNamed(context, Routes.editProfile,
                                arguments: {
                                  AppStringFile.profileuserdata:
                                      profileUserProvider.profileuserList,
                                }).then((value) {
                              _profileuserProvider
                                  .profileuserlist(AppHelper.userid ?? '');
                            });
                          },
                        ),
                        const Divider(
                          color: Colors.black12,
                          thickness: 1,
                        ),
                        Settingwidgetui(
                          icon: Icons.lock,
                          title: Languages.of(context)!.changepassword,
                          onTap: () {
                            Navigator.pushNamed(context, Routes.changePassword);
                          },
                        ),
                        const Divider(
                          color: Colors.black12,
                          thickness: 1,
                        ),
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
                          icon: Icons.help_outline_rounded,
                          title: Languages.of(context)!.articles,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ArticleScreenActivity()),
                            );
                          },
                        ),
                        const Divider(
                          color: Colors.black12,
                          thickness: 1,
                        ),
                        Settingwidgetui(
                          icon: Icons.help_outline_rounded,
                          title: Languages.of(context)!.helpnsupport,
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.helpCenterScreenActivity);
                          },
                        ),
                        const Divider(
                          color: Colors.black12,
                          thickness: 1,
                        ),
                        Settingwidgetui(
                          icon: Icons.settings,
                          title: Languages.of(context)!.settings,
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.settingScreenActivity);
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
                          height: 2.h,
                        ),
                        Text("Smile and Go \nVersion v1.0.0",
                            textAlign: TextAlign.center,
                            style: AppStyles.onboardsubtitle.copyWith(
                              fontSize: 13.sp,
                            )),
                        SizedBox(
                          height: 2.h,
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
              Padding(
                padding: EdgeInsets.only(top: 1.h, left: 7.w),
                child: profileUserProvider.profileuserList.isNotEmpty
                    ? CircleAvatar(
                        radius: 6.h,
                        backgroundColor: AppColors.colorgrey.withOpacity(0.3),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.editProfile,
                                arguments: {
                                  AppStringFile.profileuserdata:
                                      profileUserProvider.profileuserList,
                                }).then((value) {
                              _profileuserProvider
                                  .profileuserlist(AppHelper.userid ?? '');
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 5.5.h,
                            backgroundImage: profileUserProvider
                                        .profileuserList[0].userAvatar !=
                                    null
                                ? NetworkImage(APIURL.imageurl +
                                    profileUserProvider
                                        .profileuserList[0].userAvatar!)
                                : AssetImage(
                                    AppImages.profile,
                                  ) as ImageProvider,
                          ),
                        ),
                      )
                    : Container(),
              )
            ],
          );
        },
      ),
    );
  }
}
