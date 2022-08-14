import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stacked_listview/stacked_listview.dart';
import 'package:stories_editor/stories_editor.dart';
import 'package:wings/models/posts/post_model.dart';
import 'package:wings/provider/user_provider/user_provider.dart';

import '../../routes/routes.gr.dart';
import '../../widgets/widgets.dart';

// class PostsListPage extends StatefulWidget {
//   const PostsListPage({Key? key}) : super(key: key);

//   @override
//   State<PostsListPage> createState() => _PostsListPageState();
// }

// class _PostsListPageState extends State<PostsListPage> {
//   @override
//   void initState() {
//     // permission();
//     super.initState();
//   }

//   void permission() async {
//     if (await Permission.camera.status.isGranted) {
//     } else {
//       Permission.camera.request();
//       Permission.mediaLibrary.request();
//     }
//   }

//   @override
//   void didChangeDependencies() async{

//     UserProvider userProvider = UserProvider(userRepository);
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class PostsListPage extends ConsumerStatefulWidget {
  const PostsListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostsListPageState();
}

class _PostsListPageState extends ConsumerState<PostsListPage> {
  ScrollController _scrollController = ScrollController();

  double topContainerHeight = 0;
  @override
  void initState() {
    ref.read(userProvider).getCurrentUser();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return FirestoreBuilder<PostQuerySnapshot>(
      ref: postRef,
      builder:
          (context, AsyncSnapshot<PostQuerySnapshot> snapshot, Widget? child) {
        if (snapshot.hasError) return const Text('Something went wrong!');
        if (!snapshot.hasData) return const Text('Loading users...');

        PostQuerySnapshot postquerySnapshot = snapshot.data!;

        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              AutoRouter.of(context).pushWidget(StoriesEditor(
                giphyKey: '[YOUR GIPHY API KEY]',

                /// (String) required param
                onDone: (String uri) {
                  /// uri is the local path of final render Uint8List
                  /// here your code
                },
              ));
            },
            child: Icon(Icons.add),
          ),
          body: Container(
            height: _size.height,
            width: _size.width,
            child: Column(
              children: [
                AppBar(
                  leading: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage("https://picsum.photos/200/300"),
                    ),
                  ),
                  title: const Text("Posts"),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.chat_sharp),
                      onPressed: () {
                        AutoRouter.of(
                          context,
                        ).push(
                          const ChatsListRoute(),
                        );
                      },
                    ),
                  ],
                ),
                Expanded(
                  child: StackedListView(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    itemCount: 10,
                    itemExtent: 500,
                    heightFactor: 0.85,
                    builder: (_, index) {
                      return Container(
                        decoration: BoxDecoration(),
                        height: 490,
                        width: _size.width,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 1),
                                          blurRadius: 10,
                                          blurStyle: BlurStyle.normal,
                                          color: Colors.grey.shade300,
                                          spreadRadius: 3)
                                    ],
                                  ),
                                  child: Image.network(
                                      "https://images.unsplash.com/photo-1660337157997-f02497ef1a31?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80",
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 20),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Username"),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 70,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: GlassMorphism(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Icon(Icons.favorite_border,
                                                  color: Colors.white),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text("7.8k")
                                            ],
                                          ),
                                        ),
                                        start: 0.2,
                                        end: 0.3,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.comment_rounded,
                                            color: Colors.white),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text("1.8k"),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.message,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
