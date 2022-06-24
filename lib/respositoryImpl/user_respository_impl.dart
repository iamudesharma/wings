import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker_platform_interface/src/types/image_source.dart';
import 'package:logger/logger.dart';
import 'package:wings/models/user_model.dart';
import 'package:wings/provider/local_data.dart';
import 'package:wings/respository/user_respository.dart';
import 'package:wings/utils/image_picker.dart';

class UserRepositoryImpl extends UserRepository {
  final Ref reader;

  FirebaseFirestore store = FirebaseFirestore.instance;

  Logger _logger = Logger();

  UserRepositoryImpl({required this.reader});
  @override
  Future<List<User>> getUsers() async {
    List<User> user = [];

    try {
      final _users = await usersRef.get();

      for (var doc in _users.docs) {
        user.add(doc.data);
      }

      return user;
    } on Exception catch (e) {
      print(e);

      return user;

      // TODO
    }
  }

  @override
  Future<User> getUserByUid(String uid) async {
    final _users = await usersRef.whereId(isEqualTo: uid).get();

    return _users.docs.first.data;
  }

  @override
  Future<User> getUserByUsername(String username) {
    // TODO: implement getUserByUsername
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserProfile(User user) {
    // TODO: implement updateUserProfile
    throw UnimplementedError();
  }

  @override
  Future<File?> pickImage(ImageSource source) async {
    try {
      final image = await pickerImage(source);

      if (image != null) {
        return File(image.path);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> editUserDetails(
    User user,
  ) async {
    await usersRef.reference.doc(await SharedPref.getUid()).update({
      'name': user.name,
      'username': user.username,
      'bio': user.bio,
      'image': user.photoUrl,
      "email": user.email,
      "country": user.country,
      "age": user.age,
      "dob": user.dob,
    });
    // store.collection("users")..withConverter(fromFirestore: (snapshot, options) => User., toFirestore: toFirestore);
  }

  @override
  Future<bool> checkUsernameExists(String username) async {
    final user =
        await usersRef.whereUsername(isEqualTo: username).limit(1).get();
    print(user.docs.length);
    return user.docs.first.exists;
  }

  @override
  Future<User?> getUserDetails() async {
    final user = await usersRef.doc("sN9BqubAq0YbMSGsrQd2PvdV7k02").get();

    _logger.i("User ${user.data?.age}");
    if (user.exists) {
      return user.data as User;
    }
  }

  // @override
  // Future<User> getUser()async {

  //   List<User> user =[];
  // final users= await usersRef.select((snapshot) => snapshot.do);

  // users.docs.;

  // user.add();
  // }

}

@override
Future<User> getUserByUid(String uid) {
  // TODO: implement getUserByUid
  throw UnimplementedError();
}

@override
Future<User> getUserByUsername(String username) {
  // TODO: implement getUserByUsername
  throw UnimplementedError();
}

@override
Future<void> updateUserProfile(User user) {
  throw UnimplementedError();
}
