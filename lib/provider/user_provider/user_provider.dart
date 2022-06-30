import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wings/respositoryImpl/user_respository_impl.dart';

import '../../respository/user_respository.dart';
// import 'package:wings/respository/user_respository.dart';

final userDetails = FutureProvider((ref) {
  final userRep = ref.read(userRepository);

  return userRep.getUserDetails();
});

final userRepository =
    Provider<UserRepository>((ref) => UserRepositoryImpl(reader: ref));

final userProvider = ChangeNotifierProvider(
  (ref) => UserProvider(
      ref.read(
        userRepository,
      ),
      ref: ref),
);

class UserProvider extends ChangeNotifier {
  final UserRepository userRepository;
  final Ref? ref;

  UserProvider(this.userRepository, {this.ref});

  File? _image;
  bool _isImagePicked = false;

  File? get image => _image;
  bool? get isImagePicked => _isImagePicked;

  void pickImage(ImageSource source) async {
    _isImagePicked = true;
    notifyListeners();

    final _imageData = Platform.isMacOS
        ? await userRepository.pickImageMacos()
        : await userRepository.pickImage(source);

    _image = _imageData;
    notifyListeners();

    _isImagePicked = false;
    notifyListeners();
  }
}
