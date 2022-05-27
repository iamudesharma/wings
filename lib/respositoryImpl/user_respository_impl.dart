import 'package:wings/models/user_model.dart';
import 'package:wings/respository/user_respository.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<List<User>> getUsers() async {
    List<User> user = [];

    try {
      final _users = await usersRef.get();

      for (var doc in _users.docs) {
        user.add(doc.data);
      }

      return user;
    } on Exception catch (e) {
      print(e);

      return user;

      // TODO
    }

    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<User> getUserByUid(String uid) async {
    final _users = await usersRef.whereId(isEqualTo: uid).get();

   return _users.docs.first.data;

    
  }

  @override
  Future<User> getUserByUsername(String username) {
    // TODO: implement getUserByUsername
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserProfile(User user) {
    // TODO: implement updateUserProfile
    throw UnimplementedError();
  }

  // @override
  // Future<User> getUser()async {

  //   List<User> user =[];
  // final users= await usersRef.select((snapshot) => snapshot.do);

  // users.docs.;

  // user.add();
  // }

}

@override
Future<User> getUserByUid(String uid) {
  // TODO: implement getUserByUid
  throw UnimplementedError();
}

@override
Future<User> getUserByUsername(String username) {
  // TODO: implement getUserByUsername
  throw UnimplementedError();
}

@override
Future<void> updateUserProfile(User user) {
  // TODO: implement updateUserProfile
  throw UnimplementedError();
}
