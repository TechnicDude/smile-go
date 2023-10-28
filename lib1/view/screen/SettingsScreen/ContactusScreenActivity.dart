import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/utils/app_validator.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/buttons/button_widget.dart';
import 'package:smile_and_go_app/utils/textfileds/textform.dart';
import 'package:smile_and_go_app/utils/webviewscreenshow.dart';

class ContactusScreenActivity extends StatefulWidget {
  const ContactusScreenActivity({super.key});

  @override
  State<ContactusScreenActivity> createState() =>
      _ContactusScreenActivityState();
}

class _ContactusScreenActivityState extends State<ContactusScreenActivity> {
  TextEditingController _nameeditcontroller = new TextEditingController();
  TextEditingController _phoneeditcontroller = new TextEditingController();
  TextEditingController _emaileditcontroller = new TextEditingController();
  TextEditingController _messageeditcontroller = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 2.h,
                ),
                TextFormScreen(
                  textEditingController: _nameeditcontroller,
                  hinttext: 'Name',
                  validator: AppValidator.nameValidator,
                  icon: Icons.person,
                ),
                SizedBox(
                  height: 3.h,
                ),
                TextFormScreen(
                  textEditingController: _emaileditcontroller,
                  hinttext: 'E-mail',
                  icon: Icons.mail,
                  validator: AppValidator.emailValidator,
                ),
                SizedBox(
                  height: 3.h,
                ),
                TextFormScreen(
                  textEditingController: _phoneeditcontroller,
                  hinttext: 'Subject',
                  icon: Icons.topic,
                  validator: AppValidator.emptyValidator,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Column(
                  children: <Widget>[
                    Card(
                        color: AppColors.colortextgrey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                              controller: _messageeditcontroller,
                              validator: AppValidator.emptyValidator,
                              maxLines: 5,
                              decoration: InputDecoration.collapsed(
                                  hintText: " Enter your message here...",
                                  hintStyle: TextStyle(fontSize: 14.sp))),
                        ))
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                ButtonWidget(
                  text: Languages.of(context)!.submit,
                  onTap: () {
                    _formKey;
                    // Navigator.pushNamed(
                    //     context, Routes.dashBoardScreenActivity
                    //     );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
