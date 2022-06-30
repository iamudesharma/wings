import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:wings/models/post_model.dart';
import 'package:wings/widgets/resposive.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  // Post _post=Post(postText: "su", id: Uuid().v4(), ownerId: "", usernameName: "", location: , mediaUrl: mediaUrl, likes: FieldValue.increment(1),)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Post"),
      ),
      body: Responsive(
        child: Column(),
      ),
    );
  }
}
