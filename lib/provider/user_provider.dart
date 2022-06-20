import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings/respositoryImpl/user_respository_impl.dart';

import '../respository/user_respository.dart';
// import 'package:wings/respository/user_respository.dart';

final userRepository =
    Provider<UserRepository>((ref) => UserRepositoryImpl(reader: ref));
