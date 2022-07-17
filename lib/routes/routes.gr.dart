// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../models/users/user_model.dart' as _i8;
import '../page/auth/register_page.dart' as _i2;
import '../page/chats/chats_page.dart' as _i3;
import '../page/page.dart' as _i1;
import '../page/users/users_list_page.dart' as _i4;
import 'routes.dart' as _i7;

class AppRouter extends _i5.RootStackRouter {
  AppRouter(
      {_i6.GlobalKey<_i6.NavigatorState>? navigatorKey,
      required this.authGuard,
      required this.authUserDetailsGuard})
      : super(navigatorKey);

  final _i7.AuthGuard authGuard;

  final _i7.AuthUserDetailsGuard authUserDetailsGuard;

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegisterPage());
    },
    UserEditRoute.name: (routeData) {
      final args = routeData.argsAs<UserEditRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.UserEditPage(key: args.key, user: args.user));
    },
    CreatePostRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.CreatePostPage());
    },
    AuthUserDetailsRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AuthUserDetailsPage());
    },
    OtherUserAccountRoute.name: (routeData) {
      final args = routeData.argsAs<OtherUserAccountRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.OtherUserAccountPage(
              key: args.key, id: args.id, isCurrentUser: args.isCurrentUser));
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.ChatPage(key: args.key, userModel: args.userModel));
    },
    PostsListRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.PostsListPage());
    },
    UsersListRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.UsersListPage());
    },
    UserAccountRoute.name: (routeData) {
      final args = routeData.argsAs<UserAccountRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.UserAccountPage(
              key: args.key, id: args.id, isCurrentUser: args.isCurrentUser));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(HomeRoute.name, path: '/', guards: [
          authGuard,
          authUserDetailsGuard
        ], children: [
          _i5.RouteConfig(PostsListRoute.name,
              path: 'posts-list-page', parent: HomeRoute.name),
          _i5.RouteConfig(UsersListRoute.name,
              path: 'users-list-page', parent: HomeRoute.name),
          _i5.RouteConfig(UserAccountRoute.name,
              path: 'user-account-page', parent: HomeRoute.name)
        ]),
        _i5.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i5.RouteConfig(RegisterRoute.name, path: '/register-page'),
        _i5.RouteConfig(UserEditRoute.name, path: '/user-edit-page'),
        _i5.RouteConfig(CreatePostRoute.name, path: '/create-post-page'),
        _i5.RouteConfig(AuthUserDetailsRoute.name,
            path: '/auth-user-details-page'),
        _i5.RouteConfig(OtherUserAccountRoute.name,
            path: '/other-user-account-page'),
        _i5.RouteConfig(ChatRoute.name, path: '/chat-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.RegisterPage]
class RegisterRoute extends _i5.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-page');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i1.UserEditPage]
class UserEditRoute extends _i5.PageRouteInfo<UserEditRouteArgs> {
  UserEditRoute({_i6.Key? key, required _i8.UserModel? user})
      : super(UserEditRoute.name,
            path: '/user-edit-page',
            args: UserEditRouteArgs(key: key, user: user));

  static const String name = 'UserEditRoute';
}

class UserEditRouteArgs {
  const UserEditRouteArgs({this.key, required this.user});

  final _i6.Key? key;

  final _i8.UserModel? user;

  @override
  String toString() {
    return 'UserEditRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i1.CreatePostPage]
class CreatePostRoute extends _i5.PageRouteInfo<void> {
  const CreatePostRoute()
      : super(CreatePostRoute.name, path: '/create-post-page');

  static const String name = 'CreatePostRoute';
}

/// generated route for
/// [_i1.AuthUserDetailsPage]
class AuthUserDetailsRoute extends _i5.PageRouteInfo<void> {
  const AuthUserDetailsRoute()
      : super(AuthUserDetailsRoute.name, path: '/auth-user-details-page');

  static const String name = 'AuthUserDetailsRoute';
}

/// generated route for
/// [_i1.OtherUserAccountPage]
class OtherUserAccountRoute
    extends _i5.PageRouteInfo<OtherUserAccountRouteArgs> {
  OtherUserAccountRoute(
      {_i6.Key? key, required String id, required bool isCurrentUser})
      : super(OtherUserAccountRoute.name,
            path: '/other-user-account-page',
            args: OtherUserAccountRouteArgs(
                key: key, id: id, isCurrentUser: isCurrentUser));

  static const String name = 'OtherUserAccountRoute';
}

class OtherUserAccountRouteArgs {
  const OtherUserAccountRouteArgs(
      {this.key, required this.id, required this.isCurrentUser});

  final _i6.Key? key;

  final String id;

  final bool isCurrentUser;

  @override
  String toString() {
    return 'OtherUserAccountRouteArgs{key: $key, id: $id, isCurrentUser: $isCurrentUser}';
  }
}

/// generated route for
/// [_i3.ChatPage]
class ChatRoute extends _i5.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({_i6.Key? key, required _i8.UserModel userModel})
      : super(ChatRoute.name,
            path: '/chat-page',
            args: ChatRouteArgs(key: key, userModel: userModel));

  static const String name = 'ChatRoute';
}

class ChatRouteArgs {
  const ChatRouteArgs({this.key, required this.userModel});

  final _i6.Key? key;

  final _i8.UserModel userModel;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, userModel: $userModel}';
  }
}

/// generated route for
/// [_i1.PostsListPage]
class PostsListRoute extends _i5.PageRouteInfo<void> {
  const PostsListRoute() : super(PostsListRoute.name, path: 'posts-list-page');

  static const String name = 'PostsListRoute';
}

/// generated route for
/// [_i4.UsersListPage]
class UsersListRoute extends _i5.PageRouteInfo<void> {
  const UsersListRoute() : super(UsersListRoute.name, path: 'users-list-page');

  static const String name = 'UsersListRoute';
}

/// generated route for
/// [_i1.UserAccountPage]
class UserAccountRoute extends _i5.PageRouteInfo<UserAccountRouteArgs> {
  UserAccountRoute(
      {_i6.Key? key, required String id, required bool isCurrentUser})
      : super(UserAccountRoute.name,
            path: 'user-account-page',
            args: UserAccountRouteArgs(
                key: key, id: id, isCurrentUser: isCurrentUser));

  static const String name = 'UserAccountRoute';
}

class UserAccountRouteArgs {
  const UserAccountRouteArgs(
      {this.key, required this.id, required this.isCurrentUser});

  final _i6.Key? key;

  final String id;

  final bool isCurrentUser;

  @override
  String toString() {
    return 'UserAccountRouteArgs{key: $key, id: $id, isCurrentUser: $isCurrentUser}';
  }
}
