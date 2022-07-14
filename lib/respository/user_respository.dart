import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../models/user_model.dart';

abstract class UserRepository {
  // -> Method 'getUser'
  Future<List<User>> getUsers();

  Future<User?> getUserDetails();

  Future<void> updateUserProfile(User user);

  Future<User?> getUserByUid(String uid);

  Future<User> getUserByUsername(String username);

  Future<File?> pickImage(ImageSource source);
  Future<File?> pickImageMacos();


  Future<void> editUserDetails(User user);

  Future<bool> checkUsernameExists(String username);
}
