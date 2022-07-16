import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/semantics.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  UserModel({
    required this.username,
    required this.email,
    required this.photoUrl,
    required this.country,
    required this.bio,
    required this.id,
    required this.name,
    required this.age,
    required this.dob,
    this.tags = const [],
    this.phone,
  });

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);

  final String username;
  final String email;
  final String? photoUrl;
  final String? country;
  final String? bio;
  final String id;
  final List<String>? tags;
  final String name;
  final String? dob;
  final int? phone;

  @Min(13)
  final int age;

  Map<String, Object?> toJson() => _$UserModelToJson(this);
}

@Collection<UserModel>('users')
final usersRef = UserModelCollectionReference();
