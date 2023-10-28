import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/api/apphelper.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/model/todoctorslistModel.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/provider/dashboard_Provider.dart';
import 'package:smile_and_go_app/utils/app_string.dart';
import 'package:smile_and_go_app/utils/appbarforall.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/loaderscreennew.dart';
import 'package:smile_and_go_app/utils/nodatafounerror.dart';
import 'package:smile_and_go_app/view/screen/searchScreen/components/searchdoctorcardui.dart';

class SearchScreentActivity extends StatefulWidget {
  const SearchScreentActivity({super.key});

  @override
  State<SearchScreentActivity> createState() => _SearchScreentActivityState();
}

class _SearchScreentActivityState extends State<SearchScreentActivity> {
  DashBoradProvider _dashBoradProvider = DashBoradProvider();
  TextEditingController sercheditcontroler = TextEditingController();
  String searchString = '';

  @override
  void initState() {
    _dashBoradProvider = Provider.of<DashBoradProvider>(context, listen: false);
    getalldata();
    super.initState();
  }

  getalldata() async {
    await _dashBoradProvider.doctorlist();
  }

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
    return Scaffold(
        appBar: PreferredSize(
          child: AppBarScreens(
            text: Languages.of(context)!.topdoctors,
          ),
          preferredSize: Size(
              MediaQuery.of(context).size.width, AppBar().preferredSize.height),
        ),
        body: Consumer<DashBoradProvider>(
            builder: (context, dashBoradProvider, child) {
          return FutureBuilder(
              future: fetchdata(),
              builder: (context, snapshot) {
                if (!dashBoradProvider.datanotfound)
                  SizedBox(
                      height: 80.h, child: Center(child: LoaderScreennew()));

                return Padding(
                  padding: EdgeInsets.only(
                      top: 2.h, bottom: 2.h, left: 2.w, right: 2.w),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: sercheditcontroler,
                              onChanged: ((value) {
                                setState(() {
                                  searchString = sercheditcontroler.text;
                                });
                              }),
                              cursorColor: AppColors.primarycolors,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.colorgreydark),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(2.w),
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.colorgreydark),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(2.w),
                                    )),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.colorgreydark),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(2.w),
                                    )),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.search),
                                  color: AppColors.primarycolors,
                                  onPressed: () {
                                    setState(() {
                                      sercheditcontroler.clear();
                                      searchString = '';
                                    });
                                  },
                                ),
                                hintText: 'Search your doctor ...',
                                hintStyle: AppStyles.onboardbody
                                    .copyWith(color: AppColors.colorgrey),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Location 123/A",
                                      style: AppStyles.onboardbody.copyWith(
                                          color: AppColors.colorgreydark,
                                          fontSize: 14.sp),
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.secondrycolors,
                                  size: 5.w,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${bottomlist.length} founds",
                                  style: AppStyles.onboardtitle
                                      .copyWith(fontSize: 16.sp),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Default",
                                      style: AppStyles.onboardtitle.copyWith(
                                          color: AppColors.colorgreydark,
                                          fontSize: 15.sp),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Icon(
                                      Icons.tune_rounded,
                                      color: AppColors.secondrycolors,
                                      size: 5.w,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: dashBoradProvider.doctorListModel.data != null
                            ? bottomlist.isEmpty
                                ? NoDataFoundErrorScreens(
                                    height: 50.h,
                                    title: Languages.of(context)!.nodatafound,
                                  )
                                : ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    itemCount: bottomlist.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.doctordetails,
                                            arguments: {
                                              AppStringFile.doctordetails:
                                                  bottomlist[index],
                                              AppStringFile.doctorName:
                                                  bottomlist![index]
                                                          .firstName ??
                                                      ''
                                            },
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child:
                                              SearchTopDoctorsScreenActivityCard(
                                                  bottomlist[index]),
                                        ),
                                      );
                                    })
                            : Container(),
                      ),
                    ],
                  ),
                );
              });
        }));
  }
}
