import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:wings/provider/local_data.dart';
import 'package:wings/provider/user_provider/user_provider.dart';
import 'package:wings/routes/routes.gr.dart';
import 'package:wings/widgets/resposive.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wings/widgets/widgets.dart';

class UsersListPage extends ConsumerWidget {
  const UsersListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList = ref.watch(getusersListProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: SearchWidget(),
                );
              },
              child: Icon(Icons.search)),
          SizedBox(
            width: 10,
          )
        ],
        title: const Text("Users List"),
      ),
      body: userList.when(data: (users) {
        return ResponsiveLatout(
          desktopBody: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
            ),
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Vx.randomColor,
                      child: Text(
                        users[index].name[0].toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    10.heightBox,
                    Text(
                      users[index].username,
                    ),
                    10.heightBox,
                    Text(
                      users[index].name,
                    ),
                  ],
                ),
              );
            },
          ),
          mobileBody: ListView.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              return users[index].id == SharedPref.getUid()
                  ? const SizedBox.shrink()
                  : GestureDetector(
                      onTap: () {
                        context.router.push(OtherUserAccountRoute(
                            id: users[index].id, isCurrentUser: false));
                        // context.innerRouterOf<StackRouter>(
                        //   UserAccountRoute(
                        //           id: users[index].id, isCurrentUser: false)
                        //       .path,
                        // );
                        // context.router.push(UserAccountRoute(
                        //     id: users[index].id, isCurrentUser: false,),);
                        // Navigator.pushNamed(context, '/user/${users[index].id}');
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Vx.randomColor,
                          child: Text(
                            users[index].name[0].toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        title: Text(
                          users[index].username,
                        ),
                        subtitle: Text(
                          users[index].name,
                        ),
                      ),
                    );
            },
          ),
        );
      }, error: (error, stackTrace) {
        return Container();
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
