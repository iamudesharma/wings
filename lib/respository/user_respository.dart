import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../models/users/user_model.dart';

abstract class UserRepository {
  // -> Method 'getUser'
  Future<List<UserModel>> getUsers();

  Future<UserModel?> getUserDetails();

  Future<void> updateUserProfile(UserModel user);

  Future<UserModel?> getUserByUid(String uid);

  Future<List<UserModel>> getUserByUsername(String username);

  Future<File?> pickImage(ImageSource source);
  Future<File?> pickImageMacos();


  Future<void> editUserDetails(UserModel user);

  Future<bool> checkUsernameExists(String username);
}
