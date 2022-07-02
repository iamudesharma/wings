import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wings/models/post_model.dart';

import '../../routes/routes.gr.dart';
import '../../widgets/widgets.dart';

class PostsListPage extends StatefulWidget {
  const PostsListPage({Key? key}) : super(key: key);

  @override
  State<PostsListPage> createState() => _PostsListPageState();
}

class _PostsListPageState extends State<PostsListPage> {
  @override
  void initState() {
    // permission();
    super.initState();
  }

  void permission() async {
    if (await Permission.camera.status.isGranted) {
    } else {
      Permission.camera.request();
      Permission.mediaLibrary.request();
    }
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
                icon: const Icon(Icons.add),
                onPressed: () {
                  AutoRouter.of(
                    context,
                  ).push(
                    const CreatePostRoute(),
                  );
                },
              ),
            ],
          ),
          body: ResponsiveLatout(
            mobileBody: ListView.builder(
              itemCount:postquerySnapshot.docs.length ,
              itemBuilder: (BuildContext context, int index) {
                return  PostCardWidget(post: postquerySnapshot.docs[index].data,) ;
              },
            ),
            desktopBody: Container(),
          ),
        );
      },
    );
  }
}
