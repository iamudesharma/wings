 import 'package:wings/models/posts/post_model.dart';

abstract class PostsRepository {
 
  Future<void> addPost(Post post);
  Future<void> deletePost(String id);
  Future<void> editPost(Post post);
}