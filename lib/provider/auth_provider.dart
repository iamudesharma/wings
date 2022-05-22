import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings/respository/auth_respository.dart';
import 'package:wings/respositoryImpl/auth_respository_impl.dart';

// final authRespositoryImpl = AuthRespositoryImpl;
final authRepositoryProvider = Provider(
  (ref) => AuthRespositoryImpl(),
);

final authProvider = ChangeNotifierProvider.autoDispose(
  (ref) => AuthProvider(
    ref.read(
      authRepositoryProvider,
    ),
  ),
);

class AuthProvider extends ChangeNotifier {
  final AuthRespository authRespositoryImpl;

  bool isLoading = false;
  bool isLoadingSignUp = false;

  AuthProvider(this.authRespositoryImpl);

  bool isLoggedIn() {
    if (authRespositoryImpl.getCurrentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

  void logout() async {
    await authRespositoryImpl.signOut();
  }

  Future<void> login({required String email, required String password}) async {
    try {
      isLoading = true;
      notifyListeners();
      await authRespositoryImpl.login(email, password);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print(e.toString());
    }
  }

  Future<void> signUp(
      {required String email,
      required String password,
      required String username}) async {
    try {
      isLoadingSignUp = true;
      notifyListeners();
      await authRespositoryImpl.signUp(email, password, username);
      isLoadingSignUp = false;
      notifyListeners();
    } catch (e) {
      isLoadingSignUp = false;
      notifyListeners();
      print(e.toString());
    }
  }
}
