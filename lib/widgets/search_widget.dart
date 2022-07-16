import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wings/models/users/user_model.dart';
import 'package:wings/provider/user_provider/user_provider.dart';

class SearchWidget extends SearchDelegate<UserModel> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {}

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final usersList = ref.watch(searchusersListProvider(query));

        return usersList.when(
            data: ((data) {
              return data.isEmpty
                  ? Center(
                      child: "User not found".text.bold.size(20).makeCentered(),
                    )
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Vx.randomColor,
                            child: Text(
                              data[index].name[0].toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          title: Text(
                            data[index].username,
                          ),
                          subtitle: Text(
                            data[index].name,
                          ),
                        );
                      }),
                    );
            }),
            error: (error, stackTrace) => Container(),
            loading: (() => Container()));
      },
    );
  }
}
