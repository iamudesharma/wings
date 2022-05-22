import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wings/models/post_model.dart';
import 'package:wings/provider/local_data.dart';
// import 'package:wings/models/post_model.g.dart';

import 'package:wings/respository/respository.dart';

class PostsResponsitoryImpl extends PostsResponsitory {
  @override
  Future<void> addPost(Post post) async {
    await postRef.doc(await SharedPref.getUid()).set(post);
  }

  @override
  Future<void> deletePost(String id) async {
    await postRef.doc(id).delete();
  }

  @override
  Future<void> editPost(Post post) async {
    await postRef
        .doc(await SharedPref.getUid())
        .update(likes: post.likes, postText: post.postText);
  }
}
