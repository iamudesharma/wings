import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class Post {
  Post({
    required this.postText,
    required this.id,
    required this.ownerId,
    required this.usernameName,
    required this.location,
    required this.mediaUrl,
    required this.createdAt,
    required this.tags,
    this.comments,
    required this.likes,
  }) {
    _$assertPost(this);
  }

  factory Post.fromJson(Map<String, Object?> json) => _$PostFromJson(json);

  final String postText;
  final String id;
  final String ownerId;
  final String usernameName;
  final String location;
  final String mediaUrl;
  final String createdAt;
  final List<String> tags;
  final List<Comment>? comments;

  @Min(0)
  final int likes;

  Map<String, Object?> toJson() => _$PostToJson(this);
}

@Collection<Post>('posts')
@Collection<Comment>('posts/*/comments', name: "comments")
final postRef = PostCollectionReference();

@JsonSerializable(explicitToJson: true)
class Comment {
  final String username;
  final String comment;
  // Timestamp timestamp;
  final String userDp;
  final String userId;

  factory Comment.fromJson(Map<String, Object?> json) =>
      _$CommentFromJson(json);

  Comment({
    required this.username,
    required this.comment,
    required this.userDp,
    required this.userId,
  });
  Map<String, Object?> toJson() => _$CommentToJson(this);
}

// final commentsRef = CommentCollectionReference();

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}
