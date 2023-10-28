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

class TopDoctorsScreenActivityCard extends StatefulWidget {
  final List<TopdoctorslistData>? doctorlistdata;
  final String type;
  final String searchString;
  final Function? callback;

  const TopDoctorsScreenActivityCard(
      {super.key,
      required this.doctorlistdata,
      required this.type,
      required this.searchString,
      this.callback});

  @override
  State<TopDoctorsScreenActivityCard> createState() =>
      _TopDoctorsScreenActivityCardState();
}

class _TopDoctorsScreenActivityCardState
    extends State<TopDoctorsScreenActivityCard> {
  final LikeApi _likeapi = LikeApi();

  bool favorite = false;
  bool isPressed = false;

  // FAVORITE
  // Future _pressed(
  //     String favorite, String doctorid, int index, String favoriteid) async {
  //   if (favorite == "1") {
  //     LikeApi _likeapi =  LikeApi();
  //     final response = await _likeapi.disfav(doctorid);
  //     if (response['status'] == 'success') {
  //       setState(() {
  //         widget.doctorlistdata![index].favorite = "0";
  //       });
  //     }
  //     DialogHelper.showFlutterToast(strMsg: "Favoriter remove successfully");
  //   } else {
  //     LikeApi _likeapi =  LikeApi();
  //     final response = await _likeapi.fevalbum(doctorid);
  //     if (response['status'] == 'success') {
  //       setState(() {
  //         widget.doctorlistdata![index].favorite = "1";
  //       });
  //       DialogHelper.showFlutterToast(strMsg: "Favoriter added successfully");
  //     }
  //   }
  // }
  // @override
  // void initState() {
  //   // super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.doctorlistdata!.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final data = widget.doctorlistdata![index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.doctordetails,
                  arguments: {
                    AppStringFile.doctordetails: widget.doctorlistdata![index],
                    AppStringFile.doctorName:
                        widget.doctorlistdata![index].firstName ?? ''
                  },
                ).then((value) {
                  widget.callback!("ok");
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.colorgreycard,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 1.h, bottom: 1.h, left: 2.w, right: 2.w),
                  child: Row(
                    children: [
                      Container(
                        height: 20.w,
                        width: 20.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: widget.doctorlistdata![index].userAvatar !=
                                      null
                                  ? NetworkImage(APIURL.imageurl +
                                      widget.doctorlistdata![index].userAvatar!)
                                  : AssetImage(AppImages.onboardingsec)
                                      as ImageProvider,
                            )),
                        //    backgroundImage:AssetImage(AppImages.onboardingsec))),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(children: [
                              Text(
                                widget.doctorlistdata![index].firstName != null
                                    ? widget.doctorlistdata![index].firstName!
                                    : '',
                                style: AppStyles.onboardtitle
                                    .copyWith(fontSize: 15.sp),
                              ),
                              Spacer(),

                              // if (widget.doctorlistdata!.isNotEmpty)
                              //     Container(
                              //       height: 10.w,
                              //       width: 10.w,
                              //       decoration: BoxDecoration(
                              //         color: Color(0xffc9d3e0),
                              //         borderRadius: BorderRadius.circular(2.w),
                              //       ),
                              //       child: IconButton(
                              //         icon: Icon(widget.doctorlistdata![0].isFavorite != null
                              //             ? widget.doctorlistdata![0].isFavorite! == "1"
                              //                 ? Icons.favorite
                              //                 : Icons.favorite_border
                              //             : Icons.favorite_border),
                              //         onPressed: () => _pressed(
                              //             widget.doctorlistdata![0].isFavorite!,
                              //             widget.doctorlistdata![0].id!.toString(),
                              //             0,
                              //             widget.doctorlistdata![0].favorite != null
                              //                 ? widget.doctorlistdata![0].favorite!.id!
                              //                     .toString()
                              //                 : '0'),
                              //         iconSize: 6.w,
                              //         color: widget.doctorlistdata![0].isFavorite! == "1"
                              //             ? Colors.red
                              //             : Colors.black,
                              //       ),
                              //     ),

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
                            ]),
                            Divider(),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_rounded,
                                  color: AppColors.secondrycolors,
                                  size: 4.w,
                                ),
                                Text(
                                  widget.doctorlistdata![index]
                                              .locationDetail !=
                                          null
                                      ? widget.doctorlistdata![index]
                                          .locationDetail!.city!
                                      : '',
                                  style: AppStyles.onboardbody
                                      .copyWith(color: AppColors.colorgreydark),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColors.secondrycolors,
                                  size: 4.w,
                                ),
                                Text(
                                  " 4.5(35 reviews)",
                                  style: AppStyles.onboardbody
                                      .copyWith(color: AppColors.colorgreydark),
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
            ),
          );
        });
  }
}
