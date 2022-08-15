import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:wings/models/posts/post_model.dart';
import 'package:wings/provider/local_data.dart';

import '../respository/post_respository.dart';
// import 'package:wings/models/post_model.g.dart';

// import 'package:wings/respository/respository.dart';

class PostsRepositoryImpl extends PostsRepository {
  final _logger = Logger();
  @override
  Future<void> addPost(Post post) async {
    try {
      await postRef.add(post);
    } catch (e) {
      _logger.e(e);
      throw "Post can Be add";
    }
  }

  @override
  Future<void> deletePost(String id) async {
    await postRef.doc(id).delete();
  }

  @override
  Future<void> editPost(Post post) async {
    // await postRef
    //     .doc(await SharedPref.getUid())
    //     .update(likes: post.likes, postText: post.postText);
  }
}
