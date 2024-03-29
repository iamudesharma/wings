import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:wings/respository/respository.dart';
import 'package:wings/respositoryImpl/post_responsitory_impl.dart';

import '../../models/posts/post_model.dart';
import '../../respository/post_respository.dart';

final postsResponsitory =
    Provider<PostsRepository>((ref) => PostsRepositoryImpl());
final postProvider = ChangeNotifierProvider(
    (ref) => PostProvider(postsResponsitory: ref.read(postsResponsitory)));

class PostProvider extends ChangeNotifier {
  final PostsRepository postsResponsitory;
  PostProvider({
    required this.postsResponsitory,
  });

  Future<void> createPost(Post post) async {
    try {
      await postsResponsitory.addPost(post);
    } catch (e) {
      throw "Post can Be add";
    }
  }
}