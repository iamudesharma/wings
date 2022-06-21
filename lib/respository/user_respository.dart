import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../models/user_model.dart';

abstract class UserRepository {


  // -> Method 'getUser'
  Future<List<User>> getUsers();
  // "edit user"

  // -> Method 'editUser'
  Future<void> updateUserProfile(User user);

  // -> Method 'getUserByUid'
  Future<User> getUserByUid(String uid);

  // -> Method 'getUserByUsername'
  Future<User> getUserByUsername(String username);

  Future<File?> pickImage(ImageSource source);

  
}