// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
// import 'package:stories_editor/stories_editor.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  // File? editedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(),
      // body: StoriesEditor(
      //   onShare: (value){},
      //   middleBottomWidget: Text("Create Post"),
      //   giphyKey: '[HERE YOUR API KEY]',
      //   galleryThumbnailQuality: 300,
      //   onDone: (uri) {
      //     debugPrint(uri);
      //     Share.shareFiles([uri]);
      //   },
      // ),
    );
  }
}
