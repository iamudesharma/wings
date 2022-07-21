// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'package:wings/models/chats/message.dart';
import 'package:wings/models/users/user_model.dart';
import 'package:wings/provider/chat_privider/message_reply_provider.dart';
import 'package:wings/provider/local_data.dart';
import 'package:wings/provider/user_provider/user_provider.dart';
import 'package:wings/respositoryImpl/chat_repository.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:timeago/timeago.dart' as timeago;

final getChats = StreamProvider.family<List<Message>, String>((ref, id) {
  return ref.read(chatRepositoryProvider).getChatStream(id);
});
// class ChatPage extends ConsumerWidget {

//   final UserModel userModel;

//   const ChatPage({
//     Key? key,
//     required this.userModel,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context, ref) {

//   }
// }

class ChatPage extends ConsumerStatefulWidget {
  final UserModel userModel;
  const ChatPage({
    Key? key,
    required this.userModel,
  }) : super();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  late UserModel currentUser;

  @override
  void didChangeDependencies() async {
    await ref.read(userRepository).getUserDetails().then((value) {
      setState(() {
        currentUser = value!;
      });
    });

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {});
    });
    // TODO: implement initState
    super.initState();
  }

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final chatrep = ref.read(chatRepositoryProvider);
    final chats = ref.watch(getChats(widget.userModel.id));
    // final currentUser = ref.watch(userRepository);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    // });

    // print("current user ${currentUser?.phone}");
    // print("user model ${currentUser?.name}");
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
          left: 10,
          right: 10,
        ),
        child: TextFormField(
          decoration: InputDecoration(
            enabled: true,
            prefixIcon: Icon(
              Icons.emoji_emotions,
            ),
            suffix: Icon(
              Icons.file_present,
            ),
            suffixIcon: InkWell(
              onTap: () async {
                chatrep.sendTextMessage(
                  context: context,
                  text: "Hello",
                  recieverUserId: widget.userModel.id,
                  senderUser: currentUser,
                  messageReply: MessageReply("heoo", true, MessageEnum.text),
                  isGroupChat: false,
                );

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _scrollController
                      .jumpTo(_scrollController.position.maxScrollExtent);
                });
                // _scrollController.animateTo(
                //     _scrollController.position.maxScrollExtent,
                //     duration: Duration.zero,
                //     curve: Curves.easeOut);
              },
              child: Icon(
                Icons.send,
              ),
            ),
            border: OutlineInputBorder(),
          ),
          autocorrect: true,
          autofocus: true,
          enableSuggestions: true,
          enabled: true,
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.text,
          // textCapitalization: ,
          onSaved: ((newValue) {}),
          // expands: true,
        ),
      ),
      appBar: AppBar(
        // backwardsCompatibility: true,
        leading: CircleAvatar(
          backgroundColor: Colors.amber,
          // backgroundImage: NetworkImage(
          //     "${userModel.photoUrl}??data:image/png;base64,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 "),
        ),
        title: Text(
          widget.userModel.username,
        ),
      ),
      body: chats.when(
        data: (chats) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: ListView.builder(
              padding: EdgeInsets.only(
                bottom: 50,
              ),
              controller: _scrollController,
              reverse: true,
              shrinkWrap: true,
              itemCount: chats.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      right: 10, left: 10, top: 3, bottom: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        timeago.format(
                          chats[index].timeSent,
                          allowFromNow: true,
                        ),
                        style: TextStyle(
                          fontSize: 8,
                        ),
                      ),
                      BubbleSpecialOne(
                        tail: true,
                        isSender: chats[index].senderId == SharedPref.getUid()
                            ? true
                            : false,
                        seen: chats[index].isSeen,
                        text: chats[index].text,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
        error: ((error, stackTrace) => Container()),
        loading: () => CircularProgressIndicator(),
      ),
    );
  }
}
