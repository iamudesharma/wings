import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wings/main.dart';

class SharedPref {
  static saveUserUid(String uid) async {
    await sharedPreferenceProvider.setString("uid", uid);
  }

  static name(String name) async {
    await sharedPreferenceProvider.setString("name", name);
  }


  static username(String username) async {
    await sharedPreferenceProvider.setString("name", username);
  }


  static Future<String?> getUid() async {
    return sharedPreferenceProvider.getString("uid");
  }

  static Future<String?> getName() async {
    return sharedPreferenceProvider.getString("name");
  }static Future<String?> getUsername() async {
    return sharedPreferenceProvider.getString("username");
  }

  static clearUid() async {
    sharedPreferenceProvider.clear();
  }
}
