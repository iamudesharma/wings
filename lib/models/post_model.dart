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
    // this.timestampConverter,
    required this.postText,
    required this.id,
    required this.ownerId,
    required this.usernameName,
    required this.location,
    required this.mediaUrl,
    required this.createdAt,
    required this.tags,
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


  @Min(0)
  final int likes;

  Map<String, Object?> toJson() => _$PostToJson(this);
}

@Collection<Post>('posts')
final postRef = PostCollectionReference();

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}
