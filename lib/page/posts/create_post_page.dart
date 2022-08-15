// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/foundation.dart';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

import 'package:wings/models/chats/message.dart';
import 'package:wings/models/posts/post_model.dart';
import 'package:wings/provider/firebase_storage_repository.dart';
import 'package:wings/provider/local_data.dart';
// / import 'package:wings/provider/post_provider/post_provider.dart';
// import 'package:stories_editor/stories_editor.dart';
import 'package:wings/widgets/widgets.dart';

import '../../provider/post_provider/posts_provider.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  // File? editedFile;
  final TextEditingController _title = TextEditingController();
  final TextEditingController _des = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _tags = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _formKey,
        appBar: AppBar(
          title: const Text('Create Post'),
          actions: [
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child: Responsive(
            child: SingleChildScrollView(
              child: Consumer(builder: (context, ref, child) {
                final post = ref.watch(postProvider);
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 200,
                          width: 100,
                          child: Stack(
                            children: [
                              Image.file(
                                File(widget.image),
                                fit: BoxFit.cover,
                              ),
                              InkWell(
                                onTap: () {
                                  AutoRouter.of(context).navigateBack();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(Icons.edit, size: 15)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        15.heightBox,
                        textFormField(_title,
                            hintText: "Write a Title",
                            icon: Icons.man_outlined,
                            label: "Title", validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter The Empty";
                          } else {
                            return null;
                          }
                        }),
                        15.heightBox,
                        textFormField(_des,
                            hintText: "Write a Description",
                            icon: Icons.description,
                            label: "Description", validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter The Empty";
                          } else {
                            return null;
                          }
                        }),
                        15.heightBox,
                        textFormField(
                          _location,
                          hintText: "Write a location",
                          icon: Icons.share_location_rounded,
                          label: "Location",
                          validator: (value) {},
                        ),
                        15.heightBox,
                        textFormField(
                          _tags,
                          hintText: "Write a #tag",
                          icon: Icons.tag_rounded,
                          label: "#tag",
                          validator: (value) {},
                        ),
                        30.heightBox,
                        CustomButton(
                          child: const Text("Create a Post"),
                          onTap: () async {
                            final messageId = Uuid().v4();
                            // final file = File(widget.image);

                            String imageUrl = await ref
                                .read(commonFirebaseStorageRepositoryProvider)
                                .storeFileToFirebase(
                                  'post/${SharedPref.getUid()}$messageId',
                                File( widget.image),
                                );

                            final _post = Post(
                              messageEnum: MessageEnum.text,
                              postText: _des.text,
                              id: messageId,
                              ownerId: SharedPref.getUid()!,
                              usernameName: SharedPref.getUsername()??"",
                              location: "Hello World",
                              mediaUrl: imageUrl,
                              createdAt: Timestamp.now(),
                              likes: 0,
                              tags: _tags.text.split(" "),
                              comments: [],
                            );

                            _logger.i(_post.toJson());

                            await post.createPost(_post).then((value) {
                              context.navigateBack();
                            }).onError((error, stackTrace) {
                              print(error);
                              print(stackTrace);
                            });
                            // }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ));
  }
}

extension SizeBox on int {
  Widget get heightBox => SizedBox(
        height: this.toDouble(),
      );
}
