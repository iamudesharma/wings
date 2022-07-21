import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wings/models/posts/post_model.dart';
import 'package:wings/provider/user_provider/user_provider.dart';

import '../../routes/routes.gr.dart';
import '../../widgets/widgets.dart';

// class PostsListPage extends StatefulWidget {
//   const PostsListPage({Key? key}) : super(key: key);

//   @override
//   State<PostsListPage> createState() => _PostsListPageState();
// }

// class _PostsListPageState extends State<PostsListPage> {
//   @override
//   void initState() {
//     // permission();
//     super.initState();
//   }

//   void permission() async {
//     if (await Permission.camera.status.isGranted) {
//     } else {
//       Permission.camera.request();
//       Permission.mediaLibrary.request();
//     }
//   }

//   @override
//   void didChangeDependencies() async{

//     UserProvider userProvider = UserProvider(userRepository);
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class PostsListPage extends ConsumerStatefulWidget {
  const PostsListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostsListPageState();
}

class _PostsListPageState extends ConsumerState<PostsListPage> {
  @override
  void initState() {
    ref.read(userProvider).getCurrentUser();
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<PostQuerySnapshot>(
      ref: postRef,
      builder:
          (context, AsyncSnapshot<PostQuerySnapshot> snapshot, Widget? child) {
        if (snapshot.hasError) return const Text('Something went wrong!');
        if (!snapshot.hasData) return const Text('Loading users...');

        PostQuerySnapshot postquerySnapshot = snapshot.data!;

        return Scaffold(
          // backgroundColor: Colors.white,
          appBar: AppBar(
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage("https://picsum.photos/200/300"),
              ),
            ),
            title: const Text("Posts"),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.chat_sharp),
                onPressed: () {
                  AutoRouter.of(
                    context,
                  ).push(
                    const ChatsListRoute(),
                  );
                },
              ),
            ],
          ),
          body: ResponsiveLatout(
            mobileBody: ListView.builder(
              itemCount: postquerySnapshot.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return PostCardWidget(
                  post: postquerySnapshot.docs[index].data,
                );
              },
            ),
            desktopBody: Container(),
          ),
        );
      },
    );
  }
}
