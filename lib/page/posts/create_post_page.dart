import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stories_editor/stories_editor.dart';
import 'package:story_creator/story_creator.dart';
import 'package:uuid/uuid.dart';
import 'package:wings/models/post_model.dart';
import 'package:wings/provider/user_provider/user_provider.dart';
import 'package:wings/widgets/resposive.dart';
import 'package:wings/widgets/textfield_widget.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  File? editedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => kIsWeb
                          ? StoryCreator(filePath: editedFile?.path ?? "")
                          : StoriesEditor(
                              giphyKey: '[HERE YOUR API KEY]',
                              //fontFamilyList: const ['Shizuru', 'Aladin'],
                              galleryThumbnailQuality: 300,
                              //isCustomFontList: true,
                              onDone: (uri) {
                                debugPrint(uri);
                                Share.shareFiles([uri]);
                              },
                            )));
            },
            child: const Text('Open Stories Editor'),
          ),
        ));
  }
}


//  StoryCreator(
//                           filePath: user.image!.path,
//                         ),