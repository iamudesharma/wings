// import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wings/provider/auth_provider.dart';
import 'package:wings/routes/routes.gr.dart';
import 'package:wings/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserAccountPage extends StatefulWidget {
  const UserAccountPage({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return CustomScrollView(slivers: [
        SliverAppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(
                        MediaQuery.of(context).size.width - 50, 10, 10, 0),
                    items: [
                      PopupMenuItem(
                        child: Text('Logout'),
                        value: 'logout',
                        onTap: () {
                          ref.read(authProvider).logout();
                          context.navigateTo(LoginRoute());
                        },
                      ),
                      PopupMenuItem(
                        child: Text('Save'),
                        value: 'Save',
                      ),
                      PopupMenuItem(
                        child: Text('Report'),
                        value: 'Report',
                      ),
                    ],
                  );
                },
                icon: Icon(Icons.more_vert_outlined))
          ],
          // collapsedHeight: 50,
          title: const Text('username'),
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
            child: CustomTabBarView(children: [
              UserAccountDetails(),
              ListView.builder(
                itemBuilder: (context, index) => const PostCardWidget(),
                itemCount: 10,
              ),
            ], controller: controller),
          ),
        ),
        // SliverPadding(
        //   padding: EdgeInsets.all(10.0),
        //   sliver: SliverToBoxAdapter(
        //     child: Card(
        //       child: Padding(
        //         padding: const EdgeInsets.all(15.0),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Text(
        //               "Posts ",
        //               style: Theme.of(context).textTheme.headline6,
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // SliverToBoxAdapter(
        //   child: Divider(
        //     thickness: 2.0,
        //   ),
        // ),
        // SliverList(
        //   delegate: SliverChildBuilderDelegate(((context, index) {
        //     return PostCardWidget();
        //   }), childCount: 10),
        // )
      ]);
    });
    // return GestureDetector(
    //   onTap: () {
    //     FocusScope.of(context).unfocus();
    //   },
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Username'),
    //     ),
    //     body: Padding(
    //       padding: const EdgeInsets.only(
    //           top: 10.0, bottom: 0.0, left: 10, right: 10),
    //       child: Column(
    //         // mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: <Widget>[
    //           Center(
    //             child: CircleAvatar(
    //               radius: 60,
    //               backgroundImage:
    //                   NetworkImage("https://picsum.photos/200/300"),
    //             ),
    //           ),
    //           SizedBox(
    //             height: 20,
    //           ),
    //           TextFormField(
    //             initialValue: "Username",
    //             readOnly: true,
    //             textAlign: TextAlign.center,
    //             decoration: InputDecoration(
    //               border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(10),
    //               ),
    //             ),
    //             style: Theme.of(context).textTheme.headline6,
    //           ),
    //           SizedBox(
    //             height: 20,
    //           ),
    //           TextFormField(
    //             initialValue: "user@gmail.com",
    //             readOnly: true,
    //             textAlign: TextAlign.center,
    //             decoration: InputDecoration(
    //               border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(10),
    //               ),
    //             ),
    //             style: Theme.of(context).textTheme.headline6,
    //           ),
    //           SizedBox(
    //             height: 20,
    //           ),
    //           Card(
    //             child: Padding(
    //               padding: const EdgeInsets.all(15.0),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Text(
    //                     "Posts ",
    //                     style: Theme.of(context).textTheme.headline6,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           Divider(
    //             thickness: 2.0,
    //           ),
    //           Expanded(
    //               child: SingleChildScrollView(
    //             child: Column(
    //               children: [
    //                 PostCardWidget(),
    //                 PostCardWidget(),
    //                 PostCardWidget(),
    //                 PostCardWidget(),
    //               ],
    //             ),
    //           ))
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

class UserAccountDetails extends StatelessWidget {
  const UserAccountDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Stack(children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        NetworkImage("https://picsum.photos/200/300"),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      child: const Icon(
                        Icons.edit,
                        color: Colors.greenAccent,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ]),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.edit))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "username",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Name",
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 10,
          ),
          Text("Email"),
          Text("udesh2568@gmail.com"),
          SizedBox(
            height: 10,
          ),
          Text("phone"),
          Text("950694827"),
          SizedBox(
            height: 10,
          ),
          Text("Bio"),
          Text("Hi I am a developer \n I am a developer"),
          SizedBox(
            height: 10,
          ),
          Text("tags"),
          Text("#developer #flutter #android"),
          SizedBox(
            height: 10,
          ),
          Text("location"),
          Text("India"),
        ],
      ),
    );
  }
}
