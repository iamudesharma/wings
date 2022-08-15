import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:wings/provider/local_data.dart';
import '../models/users/user_model.dart' as userModel;
// import 'package:sharedpreference/sharedpreference.dart';

import '../respository/auth_respository.dart';

class AuthRespositoryImpl extends AuthRespository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
    ),
  );

  // AuthRespositoryImpl._();

  @override
  Future<void> changePassword(String password) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  User? getCurrentUser() {
    try {
      _logger.i('getCurrentUser');
      return _auth.currentUser;
    } catch (e) {
      _logger.e('getCurrentUser', e);
      return null;
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      _logger.i('login');

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      await SharedPref.saveUserUid(userCredential.user!.uid);
      
      return userCredential.user;
    } catch (e) {
      _logger.e('login', e);
      return null;
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    try {
      _logger.i('signOut');

      await SharedPref.clearUid();

      await _auth.signOut();
    } catch (e) {
      _logger.e('signOut', e);
    }
  }

  @override
  Future<User?> signUp(
    String email,
    String password,
    userModel.UserModel user,
  ) async {
    try {
      _logger.i('signUp');
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User _user = userCredential.user!;

      await _firestore.collection('users').doc(_user.uid).set({
        'username': user.username,
        'email': email,
        'id': _user.uid,
        "createdAt": FieldValue.serverTimestamp(),
        "dob": user.dob,
        "name": user.name,
        "image": "",
        "bio": "",
        "country": "India",
        "fcmToken": user.fcmToken,
        "age": user.age,
      });
      await SharedPref.saveUserUid(_user.uid);

      return _user;
    } catch (e) {
      _logger.e('signUp', e);
      return null;
    }
  }

  @override
  Future<void> updateUserData(
      String name, String email, String photoUrl, String uid) {
    // TODO: implement updateUserData
    throw UnimplementedError();
  }

  @override
  Future<User?> googleSignIn() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final user = await FirebaseAuth.instance.signInWithCredential(credential);
    SharedPref.saveUserUid(user.user!.uid);
    return user.user;
  }

  @override
  Future<void> userAdditionalDetails(
    userModel.UserModel? user,
  ) async {
    final _user = FirebaseAuth.instance.currentUser;

    await _firestore.collection('users').doc(_user!.uid).set({
      'username': user!.username,
      'email': _user.email,
      "phone": user.phone,
      'id': _user.uid,
      "createdAt": FieldValue.serverTimestamp(),
      "dob": user.dob,
      "name": user.name,
      "image": "",
      "bio": "",
      "fcmToken": user.fcmToken,
      "country": "India",
      "age": user.age,
    }).then((value) {
      print("User addded");
    });
  }
}
