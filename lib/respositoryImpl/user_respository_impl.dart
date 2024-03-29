import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker_platform_interface/src/types/image_source.dart';
import 'package:logger/logger.dart';
import 'package:wings/models/users/user_model.dart';
import 'package:wings/provider/local_data.dart';
import 'package:wings/respository/user_respository.dart';
import 'package:wings/utils/image_picker.dart';

import '../utils/mac_os_imaage_picker.dart';

class UserRepositoryImpl extends UserRepository {
  final Ref? reader;

  FirebaseFirestore store = FirebaseFirestore.instance;

  Logger _logger = Logger();

  UserRepositoryImpl({this.reader});
  @override
  Future<List<UserModel>> getUsers() async {
    List<UserModel> user = [];

    try {
      final _users = await usersRef.get();

      for (var doc in _users.docs) {
        user.add(doc.data);
      }

      return user;
    } on Exception catch (e) {
      print(e);

      return user;
    }
  }

  @override
  Future<UserModel?> getUserByUid(String uid) async {
    final _users = await usersRef.doc(uid).get();
    if (_users.exists) {
      return _users.data;
    } else {
      return null;
    }
    // return _users.docs.first.data;
  }

  @override
  Future<List<UserModel>> getUserByUsername(String username) async {
    final _users = await usersRef.whereUsername(isEqualTo: username).get();

    final List<UserModel> users = _users.docs.map((doc) => doc.data).toList();

    return users;
  }

  @override
  Future<void> updateUserProfile(UserModel user) {
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
    UserModel user,
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
  Future<UserModel?> getUserDetails() async {
    final user = await usersRef.doc(SharedPref.getUid()).get();

    _logger.i("User ${user.data?.age}");
    if (user.exists) {
      print(user.exists);
      print(user.data);

      return user.data;
    }
  }

  @override
  Future<File?> pickImageMacos() async {
    try {
      final image = await pickerImageMacos();

      if (image != null) {
        return File(image.path);
      }
    } catch (e) {
      rethrow;
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
Future<UserModel> getUserByUid(String uid) {
  // TODO: implement getUserByUid
  throw UnimplementedError();
}

@override
Future<UserModel> getUserByUsername(String username) {
  // TODO: implement getUserByUsername
  throw UnimplementedError();
}

@override
Future<void> updateUserProfile(UserModel user) {
  throw UnimplementedError();
}
