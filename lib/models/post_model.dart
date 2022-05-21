import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'post_model.g.dart';

@JsonSerializable()
class Post {
  Post({
    required this.likes,
    required this.postText,
  }) {
    _$assertPost(this);
  }

  final String postText;

  @Min(0)
  final int likes;
}

@Collection<Post>('posts')
final postRef = PostCollectionReference();
