import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/view/screen/ChatScreen/components/ChattinglistCardUIScreenActivity.dart';

class ChattinglistScreenActivitys extends StatefulWidget {
  const ChattinglistScreenActivitys({super.key});

  @override
  State<ChattinglistScreenActivitys> createState() =>
      _ChattinglistScreenActivityStates();
}

class _ChattinglistScreenActivityStates
    extends State<ChattinglistScreenActivitys> {
  bool searchshow = false;
  TextEditingController sercheditcontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: searchshow
            ? Container(
                width: double.infinity,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: AppColors.secondrycolors, width: 1),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: TextField(
                      controller: sercheditcontroler,
                      onSubmitted: ((value) {
                        // setState(() {
                        //   Adsprovider.allAdsdataserch(sercheditcontroler.text);
                        //   Adsprovider.allAdsSearch = true;
                        // });
                      }),
                      // onChanged: ((value) {
                      // }),
                      decoration: InputDecoration(
                          isDense: true,
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.clear,
                              color: AppColors.blackColor,
                            ),
                            onPressed: () {
                              print("object ok");
                              setState(() {
                                searchshow = false;
                                sercheditcontroler.clear();
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
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  top: 1.h, bottom: 0.5.h, left: 4.w, right: 4.w),
              child: ChattinglistCardUIScreenActivity(),
            );
          }),
    );
  }
}
