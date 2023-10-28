import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/api/likeapi.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/model/todoctorslistModel.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';

class SearchTopDoctorsScreenActivityCard extends StatefulWidget {
  final TopdoctorslistData doctoelist;
  const SearchTopDoctorsScreenActivityCard(this.doctoelist, {super.key});

  @override
  State<SearchTopDoctorsScreenActivityCard> createState() =>
      _SearchTopDoctorsScreenActivityCardState();
}

class _SearchTopDoctorsScreenActivityCardState
    extends State<SearchTopDoctorsScreenActivityCard> {
  LikeApi _likeapi = new LikeApi();

  bool favorite = false;
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.colorgreycard,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.only(top: 1.h, bottom: 1.h, left: 2.w, right: 2.w),
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
                    image: widget.doctoelist.userAvatar != null
                        ? NetworkImage(
                            APIURL.imageurl + widget.doctoelist.userAvatar!)
                        : AssetImage(AppImages.onboardingsec) as ImageProvider,
                  )),
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.doctoelist.firstName.toString() +
                            " " +
                            widget.doctoelist.lastName.toString(),
                        style: AppStyles.onboardtitle.copyWith(fontSize: 15.sp),
                      ),
                      Spacer(),
                      InkWell(
                          onTap: () async {
                            widget.doctoelist.isFavorite == 1
                                ? _likeapi
                                    .disfav(widget.doctoelist.id.toString())
                                : _likeapi
                                    .fevalbum(widget.doctoelist.id.toString());

                            setState(() {
                              widget.doctoelist.likeslected =
                                  widget.doctoelist.likeslected == true
                                      ? false
                                      : true;
                            });
                          },
                          child: widget.doctoelist.likeslected!
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
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.secondrycolors,
                            size: 4.w,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "4.5 (35 reviews)",
                            style: AppStyles.onboardbody.copyWith(
                                color: AppColors.colorgreydark,
                                fontSize: 14.sp),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.business_center,
                            color: AppColors.secondrycolors,
                            size: 4.w,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "2.5 Year Exp",
                            style: AppStyles.onboardbody.copyWith(
                                color: AppColors.colorgreydark,
                                fontSize: 14.sp),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_circle_right,
                            color: AppColors.secondrycolors,
                            size: 4.w,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "5 km (Distance)",
                            style: AppStyles.onboardbody.copyWith(
                                color: AppColors.colorgreydark,
                                fontSize: 14.sp),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.secondrycolors,
                            size: 4.w,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "Noida",
                            style: AppStyles.onboardbody.copyWith(
                                color: AppColors.colorgreydark,
                                fontSize: 14.sp),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
