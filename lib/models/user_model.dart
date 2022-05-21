import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  User({
    required this.name,
    required this.age,
    required this.email,
  });

  final String name;
  final int age;
  final String email;
}

@Collection<User>('users')
final usersRef = UserCollectionReference();
