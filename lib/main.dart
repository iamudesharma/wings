import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sharedpreference/sharedpreference.dart';
import 'package:wings/firebase_options.dart';
import 'package:wings/models/post_model.dart';
import "package:wings/routes/routes.gr.dart";
import "package:wings/routes/routes.dart";

late SharedPreferences sharedPreferenceProvider;
// FutureProvider((ref) async => await ¸.getInstance());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
// final _sharedPreference =  sharedPreferenceProvider;

sharedPreferenceProvider=  await SharedPreferences.getInstance();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final routesProvider = Provider((ref) => AppRouter(authGuard: AuthGuard()));

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _routes = ref.watch(routesProvider);

    return MaterialApp.router(
      title: 'Wings',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
        // colorSchemeSeed: Colors.green,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green, brightness: Brightness.dark),
        // brightness: Brightness.dark,
      ),
      routeInformationParser: _routes.defaultRouteParser(),
      routerDelegate: _routes.delegate(),
    );
  }
}
