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


  static String? getUid()  {
    return sharedPreferenceProvider.getString("uid");
  }

  static String? getName()  {
    return sharedPreferenceProvider.getString("name");
  }static String? getUsername()  {
    return sharedPreferenceProvider.getString("username");
  }

  static clearUid() async {
    sharedPreferenceProvider.clear();
  }
}
