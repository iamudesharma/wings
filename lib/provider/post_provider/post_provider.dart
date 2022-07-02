import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wings/respository/respository.dart';
import 'package:wings/respositoryImpl/post_responsitory_impl.dart';

import '../../models/post_model.dart';

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
