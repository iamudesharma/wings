import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings/firebase_options.dart';
import 'package:wings/models/post_model.dart';
import "package:wings/routes/routes.gr.dart";
import "package:wings/routes/routes.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      routeInformationParser: _routes.defaultRouteParser(),
      routerDelegate: _routes.delegate(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Post'),
        ),
        body: const UsersList());
  }
}

class UsersList extends StatelessWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<PostQuerySnapshot>(
      ref: postRef,
      builder:
          (context, AsyncSnapshot<PostQuerySnapshot> snapshot, Widget? child) {
        if (snapshot.hasError) return const Text('Something went wrong!');
        if (!snapshot.hasData) return const Text('Loading users...');

        PostQuerySnapshot querySnapshot = snapshot.data!;

        return ListView.builder(
          itemCount: querySnapshot.docs.length,
          itemBuilder: (context, index) {
            final post = querySnapshot.docs[index].data;

            return Text('User name: ${post.postText}, age ${post.likes}');
          },
        );
      },
    );
  }
}

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
