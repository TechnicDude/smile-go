// ignore_for_file:

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/api/likeapi.dart';
import 'package:smile_and_go_app/model/todoctorslistModel.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/utils/app_string.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';

class HomeScreenTopDoctorsCardActivity extends StatefulWidget {
  final List<TopdoctorslistData>? doctorlistdata;
  final String type;
  final String searchString;

  const HomeScreenTopDoctorsCardActivity(
      {super.key,
      required this.doctorlistdata,
      required this.type,
      required this.searchString});

  @override
  State<HomeScreenTopDoctorsCardActivity> createState() =>
      _HomeScreenTopDoctorsCardActivityState();
}

class _HomeScreenTopDoctorsCardActivityState
    extends State<HomeScreenTopDoctorsCardActivity> {
  final LikeApi _likeapi = LikeApi();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 30.h,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.doctorlistdata!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              final data = widget.doctorlistdata![index];
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.doctordetails,
                    arguments: {
                      AppStringFile.doctordetails:
                          widget.doctorlistdata![index],
                      AppStringFile.doctorName:
                          widget.doctorlistdata![index].firstName ?? ''
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 28.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.primarycolors,
                              ),
                              Text("4.5"),
                              Spacer(),
                              InkWell(
                                  onTap: () async {
                                    data.isFavorite == 1
                                        ? _likeapi.disfav(data.id.toString())
                                        : _likeapi.fevalbum(data.id.toString());

                                    setState(() {
                                      data.likeslected =
                                          data.likeslected == true
                                              ? false
                                              : true;
                                    });

                                    // if (favorite != "true")
                                    // {
                                    //   if (!favorite) {
                                    //     setState(() {
                                    //       favorite = true;
                                    //     });
                                    //   } else {
                                    //     setState(() {
                                    //       favorite = false;
                                    //     });
                                    //   }
                                    // }
                                    
                                  },
                                  child: data.likeslected!
                                      ? Icon(
                                          Icons.favorite,
                                          color: AppColors.primarycolors,
                                        )
                                      : Icon(
                                          Icons.favorite_border,
                                          color: AppColors.primarycolors,
                                        )),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CircleAvatar(
                            radius: 13.w,
                            backgroundImage:
                                widget.doctorlistdata![index].userAvatar != null
                                    ? NetworkImage(APIURL.imageurl +
                                        widget
                                            .doctorlistdata![index].userAvatar!)
                                    : AssetImage(
                                        AppImages.profile,
                                      ) as ImageProvider,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            widget.doctorlistdata![index].firstName != null
                                ? widget.doctorlistdata![index].firstName!
                                : '',
                            style: AppStyles.onboardtitle
                                .copyWith(fontSize: 15.sp),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text(
                            widget.doctorlistdata![index].locationDetail != null
                                ? widget.doctorlistdata![index].locationDetail!
                                    .city!
                                : '',
                            style: AppStyles.onboardsubtitle
                                .copyWith(fontSize: 14.sp, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
