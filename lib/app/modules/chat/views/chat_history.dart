import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/chat/private/private_chat.dart';
import '../../../data/models/chat_model.dart';
import 'widgets/recent_chats.dart';

class ChatHistory extends StatelessWidget {
  final String myId;

  ChatHistory({required this.myId});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<ChatRoom>>.value(
      value: PrivateChatService(myId: myId, hisId: '').getLastChatUser,
      initialData: [],
      child: RecentChats(
        myId: myId,
      ),
    );
  }
}
