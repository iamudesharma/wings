// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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
  TextEditingController _title = TextEditingController();
  TextEditingController _des = TextEditingController();
  TextEditingController _location = TextEditingController();
  TextEditingController _tags = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Post'),
          actions: [
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                // SharePlus.share(
                //   title: _title.text,
                //   description: _des.text,
                //   location: _location.text,
                //   tags: _tags.text,
                //   // file: editedFile,
                // );
              },
            ),
          ],
        ),
        // backgroundColor: Colors.black,
        body: Center(
          child: Responsive(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    15.heightBox,
                    textFormField(_title,
                        hintText: "Write a Title",
                        icon: Icons.man_outlined,
                        label: "Title",
                        validator: (value) {}),
                    15.heightBox,
                    textFormField(_des,
                        hintText: "Write a Description",
                        icon: Icons.description,
                        label: "Description",
                        validator: (value) {}),
                    15.heightBox,
                    textFormField(_location,
                        hintText: "Write a location",
                        icon: Icons.share_location_rounded,
                        label: "Location",
                        validator: (value) {}),
                    15.heightBox,
                    textFormField(_title,
                        hintText: "Write a #tag",
                        icon: Icons.tag_rounded,
                        label: "#tag",
                        validator: (value) {}),
                    CustomButton(
                      child: Text("Create a Post"),
                      onTap: ()async{
                        
                      },
                    ),
                  ],
                ),
              ),
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
