import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings/models/user_model.dart';
import 'package:wings/widgets/textfield_widget.dart';

class UserEditPage extends ConsumerStatefulWidget {
  final User? user;
  const UserEditPage({Key? key, required this.user}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserEditPageState();
}

class _UserEditPageState extends ConsumerState<UserEditPage> {
  late TextEditingController nameController;
  late TextEditingController contryController;
  late TextEditingController tagsController;
  late TextEditingController phoneController;
  late TextEditingController bioController;
// late  TextEditingController Controller;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.user?.name);
    contryController = TextEditingController(text: widget.user?.country);
    phoneController =
        TextEditingController(text: widget.user?.phone.toString() ?? "");
    tagsController =
        TextEditingController(text: widget.user?.tags?.join(",").toString());
    bioController = TextEditingController(text: widget.user?.bio);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit User"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            textFormField(nameController,
                hintText: "",
                icon: Icons.person,
                label: "Name",
                validator: (value) {}),
            SizedBox(
              height: 10,
            ),
            textFormField(phoneController,
                hintText: "Enter the Phone",
                icon: Icons.phone,
                label: "Phone",
                validator: (value) {}),
            SizedBox(
              height: 10,
            ),
            textFormField(
              bioController,
              hintText: "Enter The Bio",
              icon: Icons.biotech,
              label: "Bio",
              maxLines: 3,
              validator: (value) {},
            ),
            SizedBox(
              height: 10,
            ),
            textFormField(tagsController,
                hintText: "",
                maxLines: 2,
                icon: Icons.tag,
                label: "Tag",
                validator: (value) {}),
            SizedBox(
              height: 10,
            ),
            textFormField(contryController,
                hintText: "",
                icon: Icons.inbox,
                label: "Contry",
                validator: (value) {}),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 40)),
              child: Text("Update"),
            ),
            Spacer(),
          ],
        ));
  }
}
