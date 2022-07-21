import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
              return Container();
            },
            error: (error, stackTrace) => Container(),
            loading: () => Container(),
          ),
    );
  }
}
