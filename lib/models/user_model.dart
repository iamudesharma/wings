import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  User({
    required this.username,
    required this.email,
    required this.photoUrl,
    required this.country,
    required this.bio,
    required this.id,
    required this.isOnline,
    required this.name,
    required this.age,
    required this.dob,
  });

  final String username;
  final String email;
  final String? photoUrl;
  final String country;
  final String? bio;
  final String id;
  final bool isOnline;
  final String name;
  final String dob;

  @Min(13)
  final int age;
}

@Collection<User>('users')
final usersRef = UserCollectionReference();
