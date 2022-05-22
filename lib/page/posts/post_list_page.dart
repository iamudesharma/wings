import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:wings/models/post_model.dart';

import '../../widgets/widgets.dart';

class PostsListPage extends StatelessWidget {
  const PostsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<PostQuerySnapshot>(
      ref: postRef,
      builder:
          (context, AsyncSnapshot<PostQuerySnapshot> snapshot, Widget? child) {
        if (snapshot.hasError) return const Text('Something went wrong!');
        if (!snapshot.hasData) return const Text('Loading users...');

        PostQuerySnapshot querySnapshot = snapshot.data!;

        return Scaffold(
          // backgroundColor: Colors.white,
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage("https://picsum.photos/200/300"),
              ),
            ),
            title: Text("Posts"),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  // Navigator.pushNamed(context, Routes.createPostPage);
                },
              ),
            ],
          ),
          body: PostCardWidget(),
        );
      },
    );
  }
}
