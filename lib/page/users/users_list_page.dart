import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings/provider/user_provider/user_provider.dart';

class UsersListPage extends ConsumerWidget {
  const UsersListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList = ref.watch(getusersListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
      ),
      body: userList.when(data: (_users) {
        return Container();
      }, error: (error, stackTrace) {
        return Container();
      }, loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
