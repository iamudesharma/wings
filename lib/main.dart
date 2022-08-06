import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sharedpreference/sharedpreference.dart';
import 'package:wings/firebase_options.dart';
import 'package:wings/provider/notification_provider.dart';
import "package:wings/routes/routes.dart";
import "package:wings/routes/routes.gr.dart";

late SharedPreferences sharedPreferenceProvider;

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


if(!kIsWeb){
  NotififcationClass.init();
  NotififcationClass.onNotification();

}

  FirebaseFirestore.instance.settings = Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );

  sharedPreferenceProvider = await SharedPreferences.getInstance();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final routesProvider = Provider(
  (ref) => AppRouter(
    authGuard: AuthGuard(),
    authUserDetailsGuard: AuthUserDetailsGuard(),
  ),
);

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _routes = ref.watch(routesProvider);

    return MaterialApp.router(
      // useInheritedMediaQuery: ,
      key: navigatorKey,
      title: 'Wings',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
        // colorSchemeSeed: Colors.green,
        iconTheme: const IconThemeData(
          color: Colors.greenAccent,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
        // brightness: Brightness.dark,
      ),
      routeInformationParser: _routes.defaultRouteParser(),
      routerDelegate: _routes.delegate(),
    );
  }
}
