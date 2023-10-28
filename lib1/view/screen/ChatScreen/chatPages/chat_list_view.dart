import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/api/apphelper.dart';
import 'package:smile_and_go_app/api/chatsapi.dart';
import 'package:smile_and_go_app/chats/socket_service.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/provider/dashboard_Provider.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/dialoghelper.dart';
import 'package:smile_and_go_app/utils/nodatafounerror.dart';
import 'package:smile_and_go_app/view/screen/ChatScreen/chatPages/chat_screen.dart';

class ChattinglistScreenActivity extends StatefulWidget {
  const ChattinglistScreenActivity({Key? key}) : super(key: key);

  @override
  State<ChattinglistScreenActivity> createState() =>
      _ChattinglistScreenActivityState();
}

class _ChattinglistScreenActivityState
    extends State<ChattinglistScreenActivity> {
  DashBoradProvider _dashBoradProvider = DashBoradProvider();
  SocketService socketService = SocketService();

  @override
  void initState() {
    _dashBoradProvider = Provider.of<DashBoradProvider>(context, listen: false);
    getalldata();
    print("userid ${AppHelper.userid}");
    print(AppHelper.userid);
    print(AppHelper.AUTH_TOKEN_VALUE);
    super.initState();
  }

  getalldata() async {
    await _dashBoradProvider.doctorlist();
  }

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
            PopupMenuButton(
                enabled: true,
                offset: Offset(0, 50),
                // shape: const TooltipShape(),
                icon: Icon(
                  Icons.more_vert_outlined,
                  color: AppColors.blackColor,
                ),
                itemBuilder: (_) => <PopupMenuEntry>[
                      PopupMenuItem(
                          child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.chatSessionEndScreenACtivity);
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.star,
                            size: 2.5.h,
                          ),
                          title: Text(
                            "Chat Review",
                            style: AppStyles.onboardbody,
                          ),
                        ),
                      )),
                      PopupMenuItem(
                          child: ListTile(
                        leading: Icon(
                          Icons.downloading_rounded,
                          size: 2.5.h,
                        ),
                        title: Text(
                          "Export Chat",
                          style: AppStyles.onboardbody,
                        ),
                      )),
                      PopupMenuItem(
                          child: ListTile(
                        leading: Icon(
                          Icons.delete,
                          size: 2.5.h,
                          color: AppColors.primarycolors,
                        ),
                        title: Text(
                          "Delete Chat",
                          style: AppStyles.onboardbody
                              .copyWith(color: AppColors.primarycolors),
                        ),
                      )),

                      // itemBuilder: (context) => [
                      //       PopupMenuItem(
                      //         child: InkWell(
                      //           onTap: () {
                      //             Navigator.pop(context);
                      //             // Navigator.push(
                      //             //     context,
                      //             //     MaterialPageRoute(
                      //             //         builder: (context) => SettingScreen()));
                      //           },
                      //           child: Text(
                      //             "Clear Chat",
                      //           ),
                      //         ),
                      //         value: 2,
                      //       ),
                      //       const PopupMenuItem(
                      //         child: Text("Export Chat"),
                      //         value: 2,
                      //       ),
                      //       PopupMenuItem(
                      //         child: InkWell(child: Text("Delete Chat")),
                      //         value: 2,
                      //       )
                    ]),
          ],
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.colorswhite,
        ),
        body: Consumer<DashBoradProvider>(
            builder: (context, dashBoradProvider, child) {
          return dashBoradProvider.doctorListModel.data != null
              ? dashBoradProvider.datanotfound
                  ? NoDataFoundErrorScreens(
                      height: 50.h,
                      title: Languages.of(context)!.nodatafound,
                    )
                  : ListView.builder(
                      itemBuilder: (context, position) {
                        final data =
                            dashBoradProvider.doctorListModel.data![position];
                        //ChatItemModel chatItem = ChatHelper.getChatItem(position);
                        return Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {
                                var datas = {
                                  "doctorId": data.id.toString(),
                                };

                                chatsapi responsedata = chatsapi(datas);

                                final response =
                                    await responsedata.createchatRoom();

                                if (response['status'] == "success") {
                                  String chatRomId =
                                      response["data"]["id"].toString();

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChatScreen(
                                                image: data.userAvatar!,
                                                name: data.firstName.toString(),
                                                doctorId: chatRomId.toString(),
                                              )));
                                } else {
                                  DialogHelper.showFlutterToast(
                                      strMsg: "Something went wrong !");
                                }
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 28,
                                  backgroundImage: data.userAvatar != null
                                      ? NetworkImage(
                                          APIURL.imageurl + data.userAvatar!)
                                      : AssetImage(AppImages.onboardingsec)
                                          as ImageProvider,
                                ),
                                title: Text(
                                  data.firstName.toString(),
                                  style: AppStyles.onboardtitle
                                      .copyWith(fontSize: 16.sp),
                                ),
                                subtitle: Row(
                                  children: [
                                    Icon(
                                      position % 2 == 0
                                          ? Icons.done
                                          : Icons.done_all,
                                      color: position % 2 == 0
                                          ? Colors.grey
                                          : Colors.blue,
                                      size: 4.w,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "10:10 AM",
                                      style: AppStyles.onboardtitle
                                          .copyWith(fontSize: 13.sp),
                                    ),
                                  ],
                                ),
                                trailing: Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    " chatItem.messageDate",
                                    style: AppStyles.onboardtitle
                                        .copyWith(fontSize: 14.sp),
                                  ),
                                ),
                              ),
                            ),
                            Divider(),
                          ],
                        );
                      },
                      itemCount: dashBoradProvider.doctorListModel.data!.length,
                    )
              : Container();
        }));
  }
}
