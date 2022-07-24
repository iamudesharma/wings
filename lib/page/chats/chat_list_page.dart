import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wings/page/chats/chats_page.dart';
import 'package:wings/routes/routes.gr.dart';

import '../../provider/chat_privider/chats_provider.dart';

class ChatsListPage extends ConsumerWidget {
  const ChatsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: ref.watch(chatListProvider).when(
            data: (chatsList) {
              return ListView.builder(
                itemCount: chatsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Vx.randomColor,
                      child: Text(
                        chatsList[index].name.substring(0, 1).toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    title: Text("${chatsList[index].name}"),
                    subtitle: Text(chatsList[index].lastMessage ?? ""),
                    onTap: () {
                      AutoRouter.of(context).push(ChatRoute(
                        userModel: chatsList[index],
                      ));
                    },
                  );
                },
              );
            },
            error: (error, stackTrace) => Container(
              child: Text(error.toString()),
            ),
            loading: () => Container(),
          ),
    );
  }
}
