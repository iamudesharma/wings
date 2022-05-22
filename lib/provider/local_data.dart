import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wings/main.dart';

class SharedPref {
  static saveUserUid(String uid) async {
    await sharedPreferenceProvider.setString("uid", uid);
  }

  static Future<String?> getUid() async {
    return sharedPreferenceProvider.getString("uid");
  }

  static clearUid() async {
    sharedPreferenceProvider.clear();
  }
}
