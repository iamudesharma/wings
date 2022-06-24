import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings/models/user_model.dart';

class UserEditPage extends ConsumerStatefulWidget {
  final User? user;
  const UserEditPage({Key? key,required this.user}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserEditPageState();
}

class _UserEditPageState extends ConsumerState<UserEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit User"),
        ),
        body: Column(
          children: [],
        ));
  }
}
