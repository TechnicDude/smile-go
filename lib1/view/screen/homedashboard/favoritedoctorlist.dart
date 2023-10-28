import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/api/likeapi.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/model/favoritedoctormodel.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/provider/favoritedoctorprovider.dart';
import 'package:smile_and_go_app/utils/app_string.dart';
import 'package:smile_and_go_app/utils/appbarforall.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/dialoghelper.dart';
import 'package:smile_and_go_app/utils/internet_not_connected.dart';
import 'package:smile_and_go_app/utils/loaderscreen.dart';
import 'package:smile_and_go_app/utils/loaderscreennew.dart';
import 'package:smile_and_go_app/utils/nodatafounerror.dart';
import 'package:smile_and_go_app/view/screen/homedashboard/components/favoritedoctorscard.dart';
import 'package:smile_and_go_app/view/screen/homedashboard/components/topdoctorcardui.dart';

class FavoriteDoctorListScreenActivity extends StatefulWidget {
  final List<FovoriteData>? fovoritedata;
  final String type;

  const FavoriteDoctorListScreenActivity(
      {this.fovoritedata, required this.type, super.key});

  @override
  State<FavoriteDoctorListScreenActivity> createState() =>
      _FavoriteDoctorListScreenActivityState();
}

class _FavoriteDoctorListScreenActivityState
    extends State<FavoriteDoctorListScreenActivity> {
  FavoritedoctorProvider _favoritedoctorProvider = FavoritedoctorProvider();

  get i => null;

  @override
  void initState() {
    // TODO: implement initState
    _favoritedoctorProvider =
        Provider.of<FavoritedoctorProvider>(context, listen: false);
    _favoritedoctorProvider.fovoritedoctorlist();
    super.initState();
  }

  bool isPressed = false;
  TextEditingController sercheditcontroler = TextEditingController();
  String searchString = '';
  bool searchshow = false;

  List<FovoriteData> bottomlist = [];
  bool datashow = false;

  Future fetchdata() async {
    bottomlist = [];
    for (int i = 0;
        i < _favoritedoctorProvider.fovoritedoctorList.length;
        i++) {
      if (_favoritedoctorProvider.fovoritedoctorList[i].doctorDetail!.firstName!
          .toLowerCase()
          .contains(searchString.toLowerCase())) {
        bottomlist.add(_favoritedoctorProvider.fovoritedoctorList[i]);
      }
    }

    datashow = true;
    return bottomlist;
  }

  Future dislike(String doctorid) async {
    LikeApi _likeapi = new LikeApi();
    final response = await _likeapi.disfav(doctorid);
    await _favoritedoctorProvider.fovoritedoctorlist();

    DialogHelper.showFlutterToast(strMsg: "Favorites removed successful");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.blackColor,
          ),
          title: searchshow
              ? Container(
                  width: double.infinity,
                  height: 5.h,

                  decoration: BoxDecoration(
                      color: AppColors.colorswhite,
                      border: Border.all(color: AppColors.colorgrey),
                      borderRadius: BorderRadius.circular(2.w)),

                 
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.w),
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
                  Languages.of(context)!.favoritedoctor,
                  style: AppStyles.onboardtitle.copyWith(fontSize: 18.sp),
                ),
          automaticallyImplyLeading: false,
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
          actions: [
            if (!searchshow)
              IconButton(
                onPressed: () {
                  setState(() {
                    searchshow = true;
                  });
                },
                icon: Icon(Icons.search, color: AppColors.blackColor),
              ),
          ],
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.colorswhite,
        ),
        body:
            Provider.of<InternetConnectionStatus>(context) ==
                    InternetConnectionStatus.disconnected
                ? InternetNotAvailable()
                : Consumer<FavoritedoctorProvider>(
                    builder: (context, favoritedoctorProvider, child) {
                    return FutureBuilder(
                        future: fetchdata(),
                        builder: (context, snapshot) {
                          print(datashow);

                          if (!favoritedoctorProvider.datanotfound)
                            SizedBox(
                                height: 80.h,
                                child: Center(child: LoaderScreennew()));

                          if (snapshot.hasData && datashow) {
                            if (bottomlist.isEmpty)
                              return NoDataFoundErrorScreens(
                                title: Languages.of(context)!.nodatafound,
                              );

                            return ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: bottomlist.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.doctordetails,
                                            arguments: {
                                              AppStringFile.doctordetails:
                                                  bottomlist[index]
                                                      .patientDetail,
                                              AppStringFile.doctorName: ""
                                            },
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.colorgreycard,
                                              borderRadius:
                                                  BorderRadius.circular(2.w)),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 1.h,
                                                bottom: 1.h,
                                                left: 2.w,
                                                right: 2.w),
                                            child: Row(
                                              children: [
                                                Container(
                                                    height: 20.w,
                                                    width: 20.w,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: favoritedoctorProvider
                                                                      .fovoritedoctorList[
                                                                          index]
                                                                      .doctorDetail!
                                                                      .userAvatar !=
                                                                  null
                                                              ? NetworkImage(APIURL
                                                                      .imageurl +
                                                                  favoritedoctorProvider
                                                                      .fovoritedoctorList[
                                                                          index]
                                                                      .doctorDetail!
                                                                      .userAvatar!)
                                                              : AssetImage(AppImages
                                                                      .onboardingsec)
                                                                  as ImageProvider,
                                                        ))),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            favoritedoctorProvider
                                                                        .fovoritedoctorList[
                                                                            index]
                                                                        .doctorDetail !=
                                                                    null
                                                                ? favoritedoctorProvider
                                                                    .fovoritedoctorList[
                                                                        index]
                                                                    .doctorDetail!
                                                                    .firstName!
                                                                : 'Name',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: AppStyles
                                                                .onboardtitle
                                                                .copyWith(
                                                                    fontSize:
                                                                        15.sp),
                                                          ),
                                                          Spacer(),
                                                          InkWell(
                                                            onTap: () {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder: (ctx) =>
                                                                    AlertDialog(
                                                                  title: Text(
                                                                      Languages.of(
                                                                              context)!
                                                                          .alert,
                                                                      style: AppStyles
                                                                          .onboardtitle
                                                                          .copyWith(
                                                                              fontSize: 18.sp)),
                                                                  content: Text(
                                                                      Languages.of(
                                                                              context)!
                                                                          .favoriteremovemsg,
                                                                      style: AppStyles
                                                                          .onboardsubtitle
                                                                          .copyWith(
                                                                              fontSize: 16.sp)),
                                                                  actions: <Widget>[
                                                                    TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(ctx)
                                                                            .pop();
                                                                      },
                                                                      child: Text(
                                                                          Languages.of(context)!
                                                                              .no,
                                                                          style: AppStyles
                                                                              .onboardsubtitle
                                                                              .copyWith(fontSize: 17.sp)),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed:
                                                                          () async {
                                                                        dislike(favoritedoctorProvider.fovoritedoctorList[index].doctorDetail!.id.toString())
                                                                            .then((value) {
                                                                          Navigator.of(ctx)
                                                                              .pop();
                                                                        });
                                                                      },
                                                                      child: Text(
                                                                          Languages.of(context)!
                                                                              .yes,
                                                                          style: AppStyles
                                                                              .onboardsubtitle
                                                                              .copyWith(fontSize: 17.sp)),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                            child: Icon(
                                                              Icons.favorite,
                                                              color: AppColors
                                                                  .primarycolors,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Divider(),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .location_on_rounded,
                                                            color: AppColors
                                                                .secondrycolors,
                                                            size: 4.w,
                                                          ),
                                                          Text(
                                                            favoritedoctorProvider
                                                                        .fovoritedoctorList[
                                                                            index]
                                                                        .doctorDetail!
                                                                        .companyName !=
                                                                    null
                                                                ? favoritedoctorProvider
                                                                    .fovoritedoctorList[
                                                                        index]
                                                                    .doctorDetail!
                                                                    .companyName!
                                                                : 'Location',
                                                            style: AppStyles
                                                                .onboardbody
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .colorgreydark),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color: AppColors
                                                                .secondrycolors,
                                                            size: 4.w,
                                                          ),
                                                          Text(
                                                            " 4.5(35 reviews)",
                                                            style: AppStyles
                                                                .onboardbody
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .colorgreydark),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ));
                                });
                        
                          } else {
                            return NoDataFoundErrorScreens(
                              title: Languages.of(context)!.nodatafound,
                            );
                          }
                        });

                    // Column(
                    //   children: [
                    //     SizedBox(
                    //       height: 1.h,
                    //     ),
                    //     if (!favoritedoctorProvider.datanotfound)
                    //       SizedBox(
                    //           height: 80.h,
                    //           child: Center(child: LoaderScreennew())),
                    //     if (favoritedoctorProvider.datanotfound)
                    //       if (favoritedoctorProvider.fovoritedoctorList.isEmpty)
                    //         NoDataFoundErrorScreens(
                    //             title: Languages.of(context)!.nodatafound),
                    //     if (favoritedoctorProvider.datanotfound)
                    //       if (favoritedoctorProvider.fovoritedoctorList.isNotEmpty)
                    //         FutureBuilder(
                    //             future: fetchdata(),
                    //             builder: (context, snapshot) {
                    //               print(datashow);
                    //               if (snapshot.hasData && datashow) {
                    //                 if (bottomlist.isEmpty)
                    //                   return NoDataFoundErrorScreens(
                    //                     title: Languages.of(context)!.nodatafound,
                    //                   );
                    //                 return ListView.builder(
                    //                     physics: NeverScrollableScrollPhysics(),
                    //                     itemCount: bottomlist.length,
                    //                     itemBuilder: (context, index) {
                    //                       return Padding(
                    //                           padding: const EdgeInsets.all(8.0),
                    //                           child: //FavoriteDoctorscardScreenActivity(),
                    //                               InkWell(
                    //                             onTap: () {
                    //                               // Navigator.pushNamed(
                    //                               //   context,
                    //                               //   Routes.doctordetails,
                    //                               //   arguments: {
                    //                               //     AppStringFile.foodtypeId:
                    //                               //         favoritedoctorProvider
                    //                               //             .fovoritedoctorList[
                    //                               //                 index]
                    //                               //             .doctorDetail!.id!
                    //                               //             .toString(),
                    //                               //     AppStringFile
                    //                               //             .foodtypeName:
                    //                               //         favoritedoctorProvider
                    //                               //                 .fovoritedoctorList[
                    //                               //                     index].
                    //                               //             ''
                    //                               //   },
                    //                               // ).then((value) {
                    //                               //   favoritedoctorProvider
                    //                               //       .fovoritedoctorlist();
                    //                               // });
                    //                             },
                    //                             child: Container(
                    //                               decoration: BoxDecoration(
                    //                                   color:
                    //                                       AppColors.colorgreycard,
                    //                                   borderRadius:
                    //                                       BorderRadius.circular(
                    //                                           2.w)),
                    //                               child: Padding(
                    //                                 padding: EdgeInsets.only(
                    //                                     top: 1.h,
                    //                                     bottom: 1.h,
                    //                                     left: 2.w,
                    //                                     right: 2.w),
                    //                                 child: Row(
                    //                                   children: [
                    //                                     Container(
                    //                                       height: 20.w,
                    //                                       width: 20.w,
                    //                                       decoration: BoxDecoration(
                    //                                           shape:
                    //                                               BoxShape.circle,
                    //                                           image: DecorationImage(
                    //                                               fit: BoxFit.fill,
                    //                                               image: AssetImage(
                    //                                                   AppImages
                    //                                                       .onboardingsec))),
                    //                                     ),
                    //                                     SizedBox(
                    //                                       width: 5.w,
                    //                                     ),
                    //                                     Expanded(
                    //                                       child: Column(
                    //                                         children: [
                    //                                           Row(
                    //                                             children: [
                    //                                               Text(
                    //                                                 favoritedoctorProvider
                    //                                                     .fovoritedoctorList[
                    //                                                         index]
                    //                                                     .doctorDetail!
                    //                                                     .firstName!,
                    //                                                 maxLines: 1,
                    //                                                 overflow:
                    //                                                     TextOverflow
                    //                                                         .ellipsis,
                    //                                                 style: AppStyles
                    //                                                     .onboardtitle
                    //                                                     .copyWith(
                    //                                                         fontSize:
                    //                                                             15.sp),
                    //                                               ),
                    //                                               // Text(
                    //                                               //   "Dr. Deepika",
                    //                                               //   style: AppStyles
                    //                                               //       .onboardtitle
                    //                                               //       .copyWith(
                    //                                               //           fontSize: 15.sp),
                    //                                               // ),
                    //                                               Spacer(),
                    //                                               Icon(
                    //                                                 Icons
                    //                                                     .favorite_border,
                    //                                                 color: AppColors
                    //                                                     .primarycolors,
                    //                                               ),
                    //                                             ],
                    //                                           ),
                    //                                           Divider(),
                    //                                           Row(
                    //                                             children: [
                    //                                               Icon(
                    //                                                 Icons
                    //                                                     .location_on_rounded,
                    //                                                 color: AppColors
                    //                                                     .secondrycolors,
                    //                                                 size: 4.w,
                    //                                               ),
                    //                                               Text(
                    //                                                 " Location",
                    //                                                 style: AppStyles
                    //                                                     .onboardbody
                    //                                                     .copyWith(
                    //                                                         color: AppColors
                    //                                                             .colorgreydark),
                    //                                               )
                    //                                             ],
                    //                                           ),
                    //                                           Row(
                    //                                             children: [
                    //                                               Icon(
                    //                                                 Icons.star,
                    //                                                 color: AppColors
                    //                                                     .secondrycolors,
                    //                                                 size: 4.w,
                    //                                               ),
                    //                                               Text(
                    //                                                 " 4.5(35 reviews)",
                    //                                                 style: AppStyles
                    //                                                     .onboardbody
                    //                                                     .copyWith(
                    //                                                         color: AppColors
                    //                                                             .colorgreydark),
                    //                                               )
                    //                                             ],
                    //                                           )
                    //                                         ],
                    //                                       ),
                    //                                     )
                    //                                   ],
                    //                                 ),
                    //                               ),
                    //                             ),
                    //                           ));
                    //                     });
                    //               } else {
                    //                 return NoDataFoundErrorScreens(
                    //                   title: Languages.of(context)!.nodatafound,
                    //                 );
                    //               }
                    //             }),
                    //   ],
                    // );
                  }));
  }
}
