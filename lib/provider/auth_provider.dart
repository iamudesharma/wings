// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wings/models/users/user_model.dart';
import 'package:wings/provider/user_provider/user_provider.dart';
import 'package:wings/respository/auth_respository.dart';
import 'package:wings/respository/user_respository.dart';
import 'package:wings/respositoryImpl/auth_respository_impl.dart';
import 'package:wings/widgets/toast_widget.dart';

// final authRespositoryImpl = AuthRespositoryImpl;
final authRepositoryProvider = Provider(
  (ref) => AuthRespositoryImpl(),
);

final authProvider = ChangeNotifierProvider.autoDispose(
  (ref) => AuthProvider(
      ref.read(
        authRepositoryProvider,
      ),
      ref.read(userRepository)),
);

class AuthProvider extends ChangeNotifier {
  final AuthRespository authRespositoryImpl;
  final UserRepository userRepositoryImpl;

  bool isLoading = false;
  bool isLoadingSignUp = false;

  AuthProvider(
    this.authRespositoryImpl,
    this.userRepositoryImpl,
  );

  bool isLoggedIn() {
    if (authRespositoryImpl.getCurrentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkUserExists() async {
    if (await userRepositoryImpl
            .getUserByUid(authRespositoryImpl.getCurrentUser()!.uid) !=
        null) {
      print("User is exists true");
      return true;
    } else {
      print("User is not exists false");

      return false;
    }
  }

  void logout() async {
    ToastWidget.showSuccessToast('Logout Successfully');

    await authRespositoryImpl.signOut();
  }

  Future<void> login({required String email, required String password}) async {
    try {
      isLoading = true;
      notifyListeners();
      await authRespositoryImpl.login(email, password);
      isLoading = false;
      ToastWidget.showSuccessToast('Login Successfully');
      notifyListeners();
    } catch (e) {
      isLoading = false;
      ToastWidget.showErrorToast('Something went wrong');

      notifyListeners();
      print(e.toString());
    }
  }

  Future<void> signUp(
      {required String email,
      required String password,
      required UserModel user}) async {
    try {
      isLoadingSignUp = true;
      notifyListeners();
      await authRespositoryImpl.signUp(email, password, user);
      ToastWidget.showSuccessToast('Register Successfully');

      isLoadingSignUp = false;
      notifyListeners();
    } catch (e) {
      isLoadingSignUp = false;
      ToastWidget.showErrorToast('Something went wrong');

      notifyListeners();
      print(e.toString());
    }
  }
}
