import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wings/models/users/user_model.dart';
import 'package:wings/respositoryImpl/user_respository_impl.dart';

import '../../respository/user_respository.dart';
// import 'package:wings/respository/user_respository.dart';

final currentUserProvider = Provider<UserModel?>((ref) => null);
final userDetails = FutureProvider.family<UserModel?, String>((ref, id) async {
  final userRep = ref.read(userRepository);

  return await userRep.getUserByUid(id);
});

final getusersListProvider = FutureProvider((ref) {
  final userRep = ref.read(userRepository);

  return userRep.getUsers();
});

final searchusersListProvider =
    FutureProvider.autoDispose.family<List<UserModel>, String>((ref, username) {
  final userRep = ref.read(userRepository);

  return userRep.getUserByUsername(username);
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

  UserProvider(
    this.userRepository, {
    this.ref,
  }) : super();

  File? _image;
  bool _isImagePicked = false;

  // UserModel? _currentUsers;

  File? get image => _image;
  bool? get isImagePicked => _isImagePicked;

  // UserModel? get currentUsers => _currentUsers;

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

  Future<UserModel?> getCurrentUser() async {
    // ref.listen(provider, (previous, next) { })
    UserModel? currentUser = ref!.watch(currentUserProvider);

    try {
      currentUser = await userRepository.getUserDetails();

      debugPrint(currentUser?.username);
      if (currentUser != null) {
        return currentUser;
        // ref!.read(currentUserProvid
        //er).state = currentUser;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
