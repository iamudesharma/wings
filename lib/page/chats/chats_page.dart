// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/bubbles/bubble_normal_audio.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timeago/timeago.dart';

import 'package:wings/provider/chat_privider/chats_provider.dart';

import '../../models/chats/chats_contact_model.dart';
import '../../models/chats/message.dart';
import '../../models/users/user_model.dart';
import '../../provider/chat_privider/message_reply_provider.dart';
import '../../provider/local_data.dart';
import '../../provider/notification_provider.dart';
import '../../provider/user_provider/user_provider.dart';
import '../../utils/image_picker.dart';
import '../../utils/mac_os_imaage_picker.dart';
import '../../widgets/emoji_picker_widget.dart';
import '../../widgets/icon_with_text_widget.dart';

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

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                        if (messageData.type == MessageEnum.image) {
                          return AspectRatio(
                              aspectRatio: 9 / 16,
                              child: Image.network(messageData.text));
                        } else {
                          return BubbleSpecialOne(
                            tail: true,
                            isSender: true,
                            seen: chats[index].isSeen,
                            text: chats[index].text,
                          );
                        }
                      }
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, top: 3, bottom: 5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              format(
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
                                    return ExtraBottomSheetItems(
                                      currentUser: currentUser,
                                      recieverUserId:
                                          widget.userModel.contactId,
                                    );
                                  });
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
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

class ExtraBottomSheetItems extends ConsumerWidget {
  const ExtraBottomSheetItems({
    Key? key,
    required this.recieverUserId,
    required this.currentUser,
  }) : super(key: key);

  final String recieverUserId;
  final UserModel currentUser;

  @override
  Widget build(BuildContext context, ref) {
    final chatrep = ref.read(chatRepositoryProvider);
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
                onTap: () async {
                  XFile? image;

                  final auto = AutoRouter.of(context);
                  if (Platform.isMacOS) {
                    image = await pickerImageMacos();
                  } else {
                    image = await pickerImage(ImageSource.gallery);
                  }

                  if (image != null) {
                    //   await auto
                    //       .pushWidget(ImageCropWidget(image: File(image.path)));
                    // }

                    chatrep.sendFileMessage(
                        context: context,
                        file: File(image.path),
                        recieverUserId: recieverUserId,
                        senderUserData: currentUser,
                        messageEnum: MessageEnum.image,
                        messageReply:
                            MessageReply("heoo", false, MessageEnum.image),
                        isGroupChat: false,
                        ref: ref);
                  }
                },
                iconData: Icons.camera,
                title: "Camera"),
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

widgetType({required Message message}) {
  var type = message.type;
  switch (type) {
    case MessageEnum.image:
      return AspectRatio(
        aspectRatio: 9 / 16,
        child: Image.network(message.text),
      );

    case MessageEnum.audio:
      return BubbleNormalAudio(
        onSeekChanged: ((value) => {}),
        onPlayPauseButtonClick: () {},
      );

    case MessageEnum.video:
      return Container();

    default:
      return BubbleNormal(text: "");
  }
}
