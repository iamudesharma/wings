// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
// import 'package:stories_editor/stories_editor.dart';
import 'package:wings/widgets/widgets.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  // File? editedFile;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black,
        body: Column(
      children: [
        // textFormField(textEditingController, hintText: , icon: icon, label: label, validator: validator)
      ],
    ));
  }
}
