import 'package:firebase_auth/firebase_auth.dart';
import '../models/users/user_model.dart' ;

abstract class AuthRespository {
  Future<User?> login(String email, String password);
  Future<User?> signUp(String email, String password, UserModel user);
  User? getCurrentUser();
  Future<void> signOut();
  Future<void> sendPasswordResetEmail(String email);
  Future<void> changePassword(String password);
  Future<void> deleteUser();
  Future<void> updateUserData(
      String name, String email, String photoUrl, String uid);

  Future<User?> googleSignIn();
  Future<void> userAdditionalDetails(UserModel? user,);


}
