// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:wings/models/chats/message.dart';

part 'post_model.g.dart';

const firestoreSerializable = JsonSerializable(
  converters: firestoreJsonConverters,
  // The following values could alternatively be set inside your `build.yaml`
  explicitToJson: true,
  createFieldMap: true,
);

@firestoreSerializable
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
    required this.messageEnum,
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
  final MessageEnum messageEnum;
  @FirestoreTimestampConverter()
  final Timestamp createdAt;
  final List<String> tags;
  final List<Comment>? comments;

  @Min(0)
  final int likes;

  Map<String, Object?> toJson() => _$PostToJson(this);
  // Map<String, Object> toMap() => _$PostFieldMap(this);

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.postText == postText &&
        other.id == id &&
        other.ownerId == ownerId &&
        other.usernameName == usernameName &&
        other.location == location &&
        other.mediaUrl == mediaUrl &&
        other.createdAt == createdAt &&
        listEquals(other.tags, tags) &&
        listEquals(other.comments, comments) &&
        other.likes == likes;
  }

  @override
  int get hashCode {
    return postText.hashCode ^
        id.hashCode ^
        ownerId.hashCode ^
        usernameName.hashCode ^
        location.hashCode ^
        mediaUrl.hashCode ^
        createdAt.hashCode ^
        tags.hashCode ^
        comments.hashCode ^
        likes.hashCode;
  }

  Post copyWith({
    String? postText,
    String? id,
    String? ownerId,
    String? usernameName,
    String? location,
    String? mediaUrl,
    MessageEnum? messageEnum,
    Timestamp? createdAt,
    List<String>? tags,
    List<Comment>? comments,
    int? likes,
  }) {
    return Post(
      postText: postText ?? this.postText,
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      usernameName: usernameName ?? this.usernameName,
      location: location ?? this.location,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      messageEnum: messageEnum ?? this.messageEnum,
      createdAt: createdAt ?? this.createdAt,
      tags: tags ?? this.tags,
      comments: comments ?? this.comments,
      likes: likes ?? this.likes,
    );
  }
}

@Collection<Post>('posts')
@Collection<Comment>('posts/*/comments', name: "comments")
final postRef = PostCollectionReference();

// @JsonSerializable()
@firestoreSerializable
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

  @override
  bool operator ==(covariant Comment other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.comment == comment &&
        other.userDp == userDp &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        comment.hashCode ^
        userDp.hashCode ^
        userId.hashCode;
  }
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
