import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/services/chat/private/private_chat.dart';
import '../../../../data/models/private_chat_message.dart';
import 'attachment.dart';
import 'build_msg.dart';

class ChatScreen extends StatelessWidget {
  String myId, hisId, hisName, hisImage, myName, myImage;

  ChatScreen(
      {this.myId = '',
      this.hisId = '',
      this.hisName = '',
      this.hisImage = '',
      this.myImage = '',
      this.myName = ''});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<PrivateMessage>>.value(
      value: PrivateChatService(
        hisId: hisId,
        myId: myId,
      ).getLivePrivateMessage,
      initialData: const [],
      child: ChatScreenX(
        myId: myId,
        hisId: hisId,
        hisName: hisName,
        myImage: myImage,
        myName: myName,
        hisImage: hisImage,
      ),
    );
  }
}

class ChatScreenX extends StatelessWidget {
  String myId, hisId, hisName, hisImage, myName, myImage;

  ChatScreenX(
      {this.myId = '',
      this.hisId = '',
      this.hisName = '',
      this.hisImage = '',
      this.myImage = '',
      this.myName = ''});

  @override
  Widget build(BuildContext context) {
    final getFluffs = Provider.of<List<PrivateMessage>>(context);
    return Scaffold(
      // backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          hisName,
          style: const TextStyle(
//fontSize: Dimensions.getDesirableWidth(5),
            color: ColorsManger.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Container(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: ListView.builder(
                    reverse: true,
                    itemCount: getFluffs != null ? getFluffs.length : 0,
                   // padding: const EdgeInsets.only(
                        //  bottom: Dimensions.getDesirableHeight(2.2),
                        //  right: Dimensions.getDesirableHeight(1.2),
                        // left: Dimensions.getDesirableHeight(1.2),
                        // top: Dimensions.getDesirableHeight(2.2)),
                      //  ),
                    itemBuilder: (context, index) {
                      final PrivateMessage? old = index != getFluffs.length - 1
                          ? getFluffs[index + 1]
                          : null;
                      final PrivateMessage msg = getFluffs[index];
                      bool isMe = msg.sender == myId;
                      return Column(
                        children: [
                          ((old != null) &&
                                      (msg.time!.day != old.time!.day ||
                                          msg.time!.month !=
                                              old.time!.month)) ||
                                  (index == getFluffs.length - 1)
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Card(
                                      color: ColorsManger.light,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Text(
                                          '${msg.time!.day}/${msg.time!.month}/${msg.time!.year}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600,),
                                        ),
                                      )),
                                )
                              : const SizedBox(),
                          MessageBuilder(
                            msg: msg,
                            isMe: isMe,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Attachment(
                myId: myId,
                hisId: hisId,
                hisName: hisName,
                hisImage: hisImage,
                myImage: myImage,
                myName: myName,
              ).messageComposer(context),
            ],
          ),
        ),
      ),
    );
  }
}
