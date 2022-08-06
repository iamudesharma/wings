// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:wings/models/chats/chats_contact_model.dart';

import 'package:wings/models/chats/message.dart';
import 'package:wings/models/users/user_model.dart';
// import 'package:wings/provider/chat_privider/message_reply_provider.dart';
import 'package:wings/provider/local_data.dart';
import 'package:wings/provider/notification_provider.dart';
import 'package:wings/provider/user_provider/user_provider.dart';
// import 'package:wings/respositoryImpl/chat_repository.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:wings/widgets/widgets.dart';

import '../../provider/chat_privider/chat_privider.dart';

final isemojiShowingProvider = StateProvider<bool>((_) => true);

class ChatPage extends ConsumerStatefulWidget {
  final ChatContact userModel;
  const ChatPage({
    Key? key,
    required this.userModel,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  late UserModel currentUser;

  @override
  void initState() {
    ref.read(userRepository).getUserDetails().then((value) {
      setState(() {
        currentUser = value!;
      });
    });

    textEditingController = TextEditingController();
    _scrollController.addListener(() {
      setState(() {});
    });
    // TODO: implement initState
    super.initState();
  }

  ScrollController _scrollController = ScrollController();
  late TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    final chatrep = ref.read(chatRepositoryProvider);
    final chats = ref.watch(getChats(widget.userModel.contactId));
    final isemoji = ref.watch(isemojiShowingProvider.state);
    // final currentUser = ref.watch(userRepository);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    // });

    // print("current user ${currentUser?.phone}");
    // print("user model ${currentUser?.name}");
    return Scaffold(
      resizeToAvoidBottomInset: true,

      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.only(
      //     bottom: 20,
      //     left: 10,
      //     right: 10,
      //   ),
      //   child: TextFormField(
      //     onFieldSubmitted: ((value) async {
      //       if (value.isNotEmpty) {
      //         if (Platform.isAndroid) {
      //           await NotififcationClass.sendNotification(
      //             playerId: widget.userModel.fcm ?? "",
      //             title: textEditingController.text,
      //             userName: currentUser.username,
      //           );
      //           chatrep.sendTextMessage(
      //             context: context,
      //             text: textEditingController.text,
      //             recieverUserId: widget.userModel.contactId,
      //             senderUser: currentUser,
      //             messageReply: MessageReply("heoo", true, MessageEnum.text),
      //             isGroupChat: false,
      //           );
      //           textEditingController.clear();
      //         } else {
      //           chatrep.sendTextMessage(
      //             context: context,
      //             text: textEditingController.text,
      //             recieverUserId: widget.userModel.contactId,
      //             senderUser: currentUser,
      //             messageReply: MessageReply("heoo", true, MessageEnum.text),
      //             isGroupChat: false,
      //           );
      //           textEditingController.clear();
      //         }
      //       }
      //     }),
      //     controller: textEditingController,
      //     decoration: InputDecoration(
      //       enabled: true,
      //       prefixIcon: Icon(
      //         Icons.emoji_emotions,
      //       ),
      //       suffix: Icon(
      //         Icons.file_present,
      //       ),
      //       suffixIcon: InkWell(
      //         onTap: () async {
      //           if (Platform.isAndroid) {
      //             await NotififcationClass.sendNotification(
      //               playerId: widget.userModel.fcm ?? "",
      //               title: textEditingController.text,
      //               userName: currentUser.username,
      //             );
      //             chatrep.sendTextMessage(
      //               context: context,
      //               text: textEditingController.text,
      //               recieverUserId: widget.userModel.contactId,
      //               senderUser: currentUser,
      //               messageReply: MessageReply("heoo", true, MessageEnum.text),
      //               isGroupChat: false,
      //             );
      //             textEditingController.clear();
      //           } else {
      //             chatrep.sendTextMessage(
      //               context: context,
      //               text: textEditingController.text,
      //               recieverUserId: widget.userModel.contactId,
      //               senderUser: currentUser,
      //               messageReply: MessageReply("heoo", true, MessageEnum.text),
      //               isGroupChat: false,
      //             );
      //             textEditingController.clear();
      //           }

      //           // WidgetsBinding.instance.addPostFrameCallback((_) {
      //           //   _scrollController
      //           //       .jumpTo(_scrollController.position.maxScrollExtent);
      //           // });
      //           // _scrollController.animateTo(
      //           //     _scrollController.position.maxScrollExtent,
      //           //     duration: Duration.zero,
      //           //     curve: Curves.easeOut);
      //         },
      //         child: Icon(
      //           Icons.send,
      //         ),
      //       ),
      //       border: OutlineInputBorder(),
      //     ),
      //     autocorrect: true,
      //     autofocus: true,
      //     enableSuggestions: true,
      //     enabled: true,
      //     textInputAction: TextInputAction.newline,
      //     keyboardType: TextInputType.text,
      //     // textCapitalization: ,
      //     onSaved: ((newValue) {}),
      //     // expands: true,
      //   ),
      // ),
      appBar: AppBar(
        // backwardsCompatibility: true,
        leading: const CircleAvatar(
          backgroundColor: Colors.amber,
        ),
        title: Text(
          widget.userModel.name,
        ),
      ),
      body: chats.when(
        data: (chats) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            _scrollController
                .jumpTo(_scrollController.position.maxScrollExtent);
          });

          return Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(
                      bottom: 50,
                    ),
                    controller: _scrollController,
                    reverse: true,
                    shrinkWrap: true,
                    itemCount: chats.length,
                    itemBuilder: (BuildContext context, int index) {
                      final messageData = chats[index];
                      // var timeSent = DateFormat.Hm().format(messageData.timeSent);

                      if (!messageData.isSeen &&
                          messageData.recieverid == SharedPref.getUid()) {
                        chatrep.setChatMessageSeen(
                          context,
                          widget.userModel.contactId,
                          messageData.messageId,
                        );
                      }

                      if (messageData.senderId == SharedPref.getUid()) {
                        return BubbleSpecialOne(
                          tail: true,
                          isSender: true,
                          seen: chats[index].isSeen,
                          text: chats[index].text,
                        );
                      }
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
                              style: const TextStyle(
                                fontSize: 8,
                              ),
                            ),
                            BubbleSpecialOne(
                              tail: true,
                              isSender: false,
                              seen: chats[index].isSeen,
                              text: chats[index].text,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                isemoji.update((state) {
                                  if (state == true) {
                                    FocusScope.of(context).unfocus();
                                    return false;
                                  } else {
                                    // FocusScope.of(context).nextFocus();

                                    return true;
                                  }
                                });
                              },
                              child: const Icon(
                                Icons.emoji_emotions,
                                size: 30,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              onFieldSubmitted: ((value) async {
                                if (value.isNotEmpty) {
                                  if (Platform.isMacOS) {
                                    chatrep.sendTextMessage(
                                      context: context,
                                      text: textEditingController.text,
                                      recieverUserId:
                                          widget.userModel.contactId,
                                      senderUser: currentUser,
                                      messageReply: MessageReply(
                                          "heoo", true, MessageEnum.text),
                                      isGroupChat: false,
                                    );
                                    textEditingController.clear();
                                  } else {
                                    await NotififcationClass.sendNotification(
                                      playerId: widget.userModel.fcm ?? "",
                                      title: textEditingController.text,
                                      userName: currentUser.username,
                                    );
                                    chatrep.sendTextMessage(
                                      context: context,
                                      text: textEditingController.text,
                                      recieverUserId:
                                          widget.userModel.contactId,
                                      senderUser: currentUser,
                                      messageReply: MessageReply(
                                          "heoo", true, MessageEnum.text),
                                      isGroupChat: false,
                                    );
                                    textEditingController.clear();
                                  }
                                }
                              }),
                              controller: textEditingController,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                // enabled: true,
                                suffixIcon: InkWell(
                                  onTap: () async {
                                    if (Platform.isAndroid) {
                                      debugPrint(
                                          widget.userModel.fcm.toString());
                                      await NotififcationClass.sendNotification(
                                        playerId: widget.userModel.fcm,
                                        title: textEditingController.text,
                                        userName: currentUser.username,
                                      );
                                      chatrep.sendTextMessage(
                                        context: context,
                                        text: textEditingController.text,
                                        recieverUserId:
                                            widget.userModel.contactId,
                                        senderUser: currentUser,
                                        messageReply: MessageReply(
                                            "heoo", true, MessageEnum.text),
                                        isGroupChat: false,
                                      );
                                      textEditingController.clear();
                                    } else {
                                      chatrep.sendTextMessage(
                                        context: context,
                                        text: textEditingController.text,
                                        recieverUserId:
                                            widget.userModel.contactId,
                                        senderUser: currentUser,
                                        messageReply: MessageReply(
                                            "heoo", true, MessageEnum.text),
                                        isGroupChat: false,
                                      );
                                      textEditingController.clear();
                                    }
                                  },
                                  child: const Icon(
                                    Icons.send,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
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
                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              showModalBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  builder: (context) {
                                    return ExtraBottomSheetItems();
                                  });
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: const Icon(
                                Icons.file_present,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      EmojiPickerWidget(
                          isemoji: isemoji,
                          textEditingController: textEditingController),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        error: ((error, stackTrace) => Container()),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}

class ExtraBottomSheetItems extends StatelessWidget {
  const ExtraBottomSheetItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: Center(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,

          alignment: WrapAlignment.spaceEvenly,
          runSpacing: 10,
          //  runAlignment: ,/
          children: [
            IconWithTextWidget(
                onTap: () {}, iconData: Icons.camera, title: "Camera"),
            IconWithTextWidget(
                onTap: () {},
                iconData: Icons.photo_album,
                title: "Photo Album"),
            IconWithTextWidget(
                onTap: () {}, iconData: Icons.video_call, title: "Video Call"),
            IconWithTextWidget(
                onTap: () {},
                iconData: Icons.document_scanner,
                title: "Document"),
            // IconWithTextWidget(onTap: (){}, iconData: Icons.camera, title: "Camera"),
          ],
        ),
      ),
    );
  }
}
