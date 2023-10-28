import 'package:flutter/material.dart';
import 'package:smile_and_go_app/view/screen/ChatScreen/chatPages/model/call_model/CallItemModel.dart';
import 'package:smile_and_go_app/view/screen/ChatScreen/chatPages/model/call_model/call_helper.dart';

class CallsView extends StatelessWidget {
  const CallsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        CallItemModel callItemModel = CallHelper.getCallItem(position);
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(callItemModel.image),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    callItemModel.name,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text(
                                  callItemModel.dateTime,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.call,
                            color: Color(0xff00b09c),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
          ],
        );
      },
      itemCount: CallHelper.itemCount,
// 19 sept 2023
// ab mujhe kisi v halat me ghar se bahar nikalna hoga, mere gharvale meri sadi jabardasti krana chahte h, meri sister
// meri sabse bdi dusman ban gai h, kutti sali nafarat ho gya h mujhe issse,
// mujhe kisi v halat me yha se nikalna h kuch v krke mai dubara ghar pr nhi aaungi kuch v ho jaye
// mujhe nhi aana chahiye tha ghar , mujhe ghar se nafarat ho gya h,
// ab mujhe sadi ke liye ha krna hoga uske baad hi mai yha se nikal skti hu,
// mai ha bol dungi usko uske baad kuch time bol dungi ki time chahiye tmhe janne ke liye kuch baad hi hm sadi krenge
// jisse ki aage chalkar koi problem na ho
// mai aisa hi karungi ab, sabke sath apna emotion dard, gussa side me rakhkar
// normal behave krungi,
// mai yha se jane ke liye sari kosis krungi, ho skta h mujhe ak ya do din late v ho jaye but mai karungi normal rhungi mai
// sala ak bar ghar se nikalne do mujhe , dubara mud kar dekhungi tk nhi mai kisi ko
// bas tab tk mujhe normal rhna hoga sabse is chudail se v
//
    );
  }
}
