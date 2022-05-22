import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comments_model.g.dart';

@JsonSerializable()
class Comment {
  final String username;
  final String comment;
  // Timestamp timestamp;
  final String userDp;
  final String userId;

  Comment({
  required  this.username,
   required this.comment,
    // this.timestamp,
   required this.userDp,
  required  this.userId,
  });
}

@Collection<Comment>('posts')
final commentsRef = CommentCollectionReference();
