// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import 'package:wings/models/users/user_model.dart';
import 'package:wings/provider/auth_provider.dart';
import 'package:wings/provider/local_data.dart';
import 'package:wings/provider/user_provider/user_provider.dart';
import 'package:wings/respositoryImpl/chat_repository.dart';
import 'package:wings/routes/routes.gr.dart';
import 'package:wings/widgets/widgets.dart';

class UserAccountPage extends StatefulWidget {
  const UserAccountPage({
    Key? key,
    required this.id,
    required this.isCurrentUser,
  }) : super(key: key);

  final String id;

  final bool isCurrentUser;

  @override
  State<UserAccountPage> createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final _userDetails = ref.watch(userDetails(widget.id));

        return _userDetails.when(data: (_user) {
          _logger.i("User name ${_user?.name}");
          _logger.i("User name ${_user?.username}");

          return CustomScrollView(slivers: [
            SliverAppBar(
              actions: [
                widget.isCurrentUser
                    ? IconButton(
                        onPressed: () {
                          showMenu(
                            context: context,
                            position: RelativeRect.fromLTRB(
                                MediaQuery.of(context).size.width - 50,
                                10,
                                10,
                                0),
                            items: [
                              PopupMenuItem(
                                child: const Text('Logout'),
                                value: 'logout',
                                onTap: () {
                                  ref.read(authProvider).logout();
                                  context.navigateTo(const LoginRoute());
                                },
                              ),
                              const PopupMenuItem(
                                child: const Text('Save'),
                                value: 'Save',
                              ),
                              const PopupMenuItem(
                                child: const Text('Report'),
                                value: 'Report',
                              ),
                            ],
                          );
                        },
                        icon: const Icon(Icons.more_vert_outlined))
                    : const SizedBox.shrink()
              ],
              // collapsedHeight: 50,
              title: Text(_user?.username ?? ""),
              floating: true,
              pinned: true,
              expandedHeight: 150,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                stretchModes: [
                  StretchMode.blurBackground,
                  StretchMode.zoomBackground
                ],
                background: Image.network(
                  'https://picsum.photos/200/300',
                  fit: BoxFit.cover,
                ),
              ),
              stretch: true,
              bottom: TabBar(controller: controller, tabs: [
                const Tab(
                  icon: const Icon(Icons.person),
                  text: 'Profile',
                ),
                const Tab(
                  icon: const Icon(
                    Icons.post_add,
                  ),
                  text: 'Posts',
                ),
              ]),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: TabBarView(children: [
                  UserAccountDetails(
                    user: _user,
                  ),
                  ResponsiveLatout(
                    mobileBody: ListView.builder(
                      itemBuilder: (context, index) => Container(),
                      itemCount: 10,
                    ),
                    desktopBody: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) => Container(),
                      itemCount: 10,
                    ),
                  )
                ], controller: controller),
              ),
            ),
          ]);
        }, error: (e, stackTrace) {
          return Center(child: Text("${stackTrace}"));
        }, loading: () {
          return const Center(
            child: const CircularProgressIndicator(),
          );
        });
      }),
    );
  }
}

class UserAccountDetails extends ConsumerWidget {
  final UserModel? user;
  const UserAccountDetails({
    this.user,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userProvider = ref.watch(userProvider);
    // final _userDetails = ref.watch(userDetails);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                child: CupertinoContextMenu(
                  previewBuilder: (context, animation, child) => Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    child: child,
                  ),
                  actions: [
                    CupertinoContextMenuAction(
                      trailingIcon: Icons.camera,
                      child: const Text('Camera'),
                      onPressed: () async {
                        _userProvider.pickImage(ImageSource.camera);

                        // Navigator.pop(context);
                      },
                    ),
                    CupertinoContextMenuAction(
                      child: const Text('Gallery'),
                      trailingIcon: Icons.photo_album,
                      onPressed: () async {
                        _userProvider.pickImage(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                  child: _userProvider.image == null
                      ? CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(user?.photoUrl ??
                              "https://picsum.photos/200/300"))
                      : CircleAvatar(
                          radius: 40,
                          backgroundImage: MemoryImage(
                              _userProvider.image!.readAsBytesSync()),
                        ),
                ),
              ),
              IconWithTextWidget(
                iconData: Icons.edit,
                onTap: () {
                  AutoRouter.of(context).push(
                    UserEditRoute(
                      user: user,
                    ),
                  );
                },
                title: "Edit",
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "username",
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(user!.username),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Name",
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(user!.name),
          const SizedBox(
            height: 10,
          ),
          const Text("Email"),
          Text(user!.email),
          const SizedBox(
            height: 10,
          ),
          const Text("phone"),
          Text(user?.phone.toString() ?? ""),
          const SizedBox(
            height: 10,
          ),
          const Text("Bio"),
          Text(user?.bio ?? " Hi I am a developer \n I am a developer"),
          const SizedBox(
            height: 10,
          ),
          const Text("tags"),
          const Text(""),
          const SizedBox(
            height: 10,
          ),
          const Text("location"),
          const Text("India"),
        ],
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:auto_route/auto_route.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:logger/logger.dart';

// import 'package:wings/models/user_model.dart';
// import 'package:wings/provider/auth_provider.dart';
// import 'package:wings/provider/user_provider/user_provider.dart';
// import 'package:wings/routes/routes.gr.dart';
// import 'package:wings/widgets/widgets.dart';

class OtherUserAccountPage extends StatefulWidget {
  const OtherUserAccountPage({
    Key? key,
    required this.id,
    required this.isCurrentUser,
  }) : super(key: key);

  final String id;

  final bool isCurrentUser;

  @override
  State<OtherUserAccountPage> createState() => _OtherUserAccountPage();
}

class _OtherUserAccountPage extends State<OtherUserAccountPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final _userDetails = ref.watch(userDetails(widget.id));

        return _userDetails.when(data: (_user) {
          _logger.i("User name ${_user?.name}");
          _logger.i("User name ${_user?.username}");

          return CustomScrollView(slivers: [
            SliverAppBar(
              actions: [
                widget.isCurrentUser
                    ? IconButton(
                        onPressed: () {
                          showMenu(
                            context: context,
                            position: RelativeRect.fromLTRB(
                                MediaQuery.of(context).size.width - 50,
                                10,
                                10,
                                0),
                            items: [
                              PopupMenuItem(
                                child: const Text('Logout'),
                                value: 'logout',
                                onTap: () {
                                  ref.read(authProvider).logout();
                                  context.navigateTo(const LoginRoute());
                                },
                              ),
                              const PopupMenuItem(
                                child: const Text('Save'),
                                value: 'Save',
                              ),
                              const PopupMenuItem(
                                child: const Text('Report'),
                                value: 'Report',
                              ),
                            ],
                          );
                        },
                        icon: const Icon(Icons.more_vert_outlined))
                    : const SizedBox.shrink()
              ],
              // collapsedHeight: 50,
              title: Text(_user?.username ?? ""),
              floating: true,
              pinned: true,
              expandedHeight: 150,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                stretchModes: const [
                  StretchMode.blurBackground,
                  StretchMode.zoomBackground
                ],
                background: Image.network(
                  'https://picsum.photos/200/300',
                  fit: BoxFit.cover,
                ),
              ),
              stretch: true,
              bottom: TabBar(controller: controller, tabs: const [
                Tab(
                  icon: Icon(Icons.person),
                  text: 'Profile',
                ),
                Tab(
                  icon: Icon(
                    Icons.post_add,
                  ),
                  text: 'Posts',
                ),
              ]),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: TabBarView(controller: controller, children: [
                  OtherUserAccountDetails(
                    user: _user,
                  ),
                  ResponsiveLatout(
                    mobileBody: ListView.builder(
                      itemBuilder: (context, index) => Container(),
                      itemCount: 10,
                    ),
                    desktopBody: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) => Container(),
                      itemCount: 10,
                    ),
                  )
                ]),
              ),
            ),
          ]);
        }, error: (e, stackTrace) {
          return Center(child: Text("${stackTrace}"));
        }, loading: () {
          return const Center(
            child: const CircularProgressIndicator(),
          );
        });
      }),
    );
  }
}

class OtherUserAccountDetails extends ConsumerWidget {
  final UserModel? user;
  const OtherUserAccountDetails({
    this.user,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userProvider = ref.watch(userProvider);
    // final _userDetails = ref.watch(userDetails);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                child: CupertinoContextMenu(
                  previewBuilder: (context, animation, child) => Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    child: child,
                  ),
                  actions: [
                    CupertinoContextMenuAction(
                      trailingIcon: Icons.camera,
                      child: const Text('Camera'),
                      onPressed: () async {
                        _userProvider.pickImage(ImageSource.camera);

                        // Navigator.pop(context);
                      },
                    ),
                    CupertinoContextMenuAction(
                      child: const Text('Gallery'),
                      trailingIcon: Icons.photo_album,
                      onPressed: () async {
                        _userProvider.pickImage(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                  child: _userProvider.image == null
                      ? CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(user?.photoUrl ??
                              "https://picsum.photos/200/300"))
                      : CircleAvatar(
                          radius: 40,
                          backgroundImage: MemoryImage(
                              _userProvider.image!.readAsBytesSync()),
                        ),
                ),
              ),
              IconWithTextWidget(
                iconData: Icons.message,
                onTap: () async {
                  final autoRoutes = AutoRouter.of(context);

                  // // autoRoutes.push(
                  // //   ChatRoute(
                  // //     // userModel: user!,
                  // //   ),
                  // );
                },
                title: "Message",
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "username",
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(user!.username),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Name",
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(user!.name),
          const SizedBox(
            height: 10,
          ),
          const Text("Email"),
          Text(user!.email),
          const SizedBox(
            height: 10,
          ),
          const Text("phone"),
          Text(user?.phone.toString() ?? ""),
          const SizedBox(
            height: 10,
          ),
          const Text("Bio"),
          Text(user?.bio ?? " Hi I am a developer \n I am a developer"),
          const SizedBox(
            height: 10,
          ),
          const Text("tags"),
          const Text(""),
          const SizedBox(
            height: 10,
          ),
          const Text("location"),
          const Text("India"),
        ],
      ),
    );
  }
}
