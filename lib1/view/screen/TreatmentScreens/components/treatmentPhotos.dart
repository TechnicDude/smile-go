import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/buttons/button_iconwithbackground.dart';
import 'package:smile_and_go_app/utils/dialoghelper.dart';

class TreatmentPhotosScreenUI extends StatefulWidget {
  final Function()? onTap;
  const TreatmentPhotosScreenUI({super.key, required this.onTap});

  @override
  State<TreatmentPhotosScreenUI> createState() =>
      _TreatmentPhotosScreenUIState();
}

class _TreatmentPhotosScreenUIState extends State<TreatmentPhotosScreenUI> {
  final ImagePicker imgpicker = ImagePicker();

  XFile? imagefiles;

  openImages() async {
    try {
      final XFile? image =
          await imgpicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        imagefiles = image;
        setState(() {});
      } else {
        DialogHelper.showFlutterToast(strMsg: 'No image is selected');
      }
    } catch (e) {
      DialogHelper.showFlutterToast(strMsg: 'Error while picking file');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                InkWell(
                  onTap: () {
                    openImages();
                  },
                  child: Container(
                    height: 24.w,
                    width: 24.w,
                    decoration: BoxDecoration(
                        color: AppColors.colorgrey,
                        borderRadius: BorderRadius.circular(1.w)),
                  ),
                ),
                Image.asset(
                  AppImages.gallary,
                ),
              ],
            ),
            // ListView.builder(
            //     itemCount: 2,
            //       scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index) {
            //       return
            Padding(
              padding: EdgeInsets.only(left: 3.w, right: 3.w),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(1.w)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(AppImages.onboardingsec)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.w),
                    child: Row(
                      children: [
                        IconwithBackgroundUI(
                          height: 5.w,
                          width: 5.w,
                          icon: Icons.edit,
                          size: 4.w,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        IconwithBackgroundUI(
                          height: 5.w,
                          width: 5.w,
                          icon: Icons.delete,
                          size: 4.w,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: Text(
                                  Languages.of(context)!.alert,
                                  style: AppStyles.onboardbody.copyWith(
                                      fontSize: 18.sp,
                                      color: AppColors.primarycolors),
                                ),
                                content: Text(
                                  Languages.of(context)!.deletemsg,
                                  style: AppStyles.onboardsubtitle.copyWith(
                                      fontSize: 16.sp,
                                      color: AppColors.secondrycolors),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Text(
                                      Languages.of(context)!.no,
                                      style: AppStyles.onboardbody.copyWith(
                                          fontSize: 16.sp,
                                          color: AppColors.secondrycolors),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      // open this comment when needs

                                      // setState(() {
                                      //   _error = '';
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
                                    child: Text(
                                      Languages.of(context)!.yes,
                                      style: AppStyles.onboardbody
                                          .copyWith(fontSize: 16.sp),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // );
              // }
            ),
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(1.w)),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(AppImages.onboardingsec)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.w),
                  child: Row(
                    children: [
                      IconwithBackgroundUI(
                        height: 5.w,
                        width: 5.w,
                        icon: Icons.edit,
                        size: 4.w,
                        onTap: () {},
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      IconwithBackgroundUI(
                        height: 5.w,
                        width: 5.w,
                        icon: Icons.delete,
                        size: 4.w,
                        onTap: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
