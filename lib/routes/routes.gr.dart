// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../models/chats/chats_contact_model.dart' as _i11;
import '../models/users/user_model.dart' as _i10;
import '../page/auth/login_page.dart' as _i2;
import '../page/chats/chat_list_page.dart' as _i6;
import '../page/chats/chats_page.dart' as _i5;
import '../page/home_page.dart' as _i1;
import '../page/page.dart' as _i3;
import '../page/users/user_account_page.dart' as _i4;
import 'routes.dart' as _i9;

class AppRouter extends _i7.RootStackRouter {
  AppRouter(
      {_i8.GlobalKey<_i8.NavigatorState>? navigatorKey,
      required this.authGuard,
      required this.authUserDetailsGuard})
      : super(navigatorKey);

  final _i9.AuthGuard authGuard;

  final _i9.AuthUserDetailsGuard authUserDetailsGuard;

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    LoginRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RegisterPage());
    },
    UserEditRoute.name: (routeData) {
      final args = routeData.argsAs<UserEditRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.UserEditPage(key: args.key, user: args.user));
    },
    CreatePostRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.CreatePostPage());
    },
    AuthUserDetailsRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.AuthUserDetailsPage());
    },
    OtherUserAccountRoute.name: (routeData) {
      final args = routeData.argsAs<OtherUserAccountRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.OtherUserAccountPage(
              key: args.key, id: args.id, isCurrentUser: args.isCurrentUser));
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.ChatPage(key: args.key, userModel: args.userModel));
    },
    ChatsListRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ChatsListPage());
    },
    PostsListRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.PostsListPage());
    },
    UsersListRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.UsersListPage());
    },
    UserAccountRoute.name: (routeData) {
      final args = routeData.argsAs<UserAccountRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.UserAccountPage(
              key: args.key, id: args.id, isCurrentUser: args.isCurrentUser));
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(HomeRoute.name, path: '/', guards: [
          authGuard,
          authUserDetailsGuard
        ], children: [
          _i7.RouteConfig(PostsListRoute.name,
              path: 'posts-list-page', parent: HomeRoute.name),
          _i7.RouteConfig(UsersListRoute.name,
              path: 'users-list-page', parent: HomeRoute.name),
          _i7.RouteConfig(UserAccountRoute.name,
              path: 'user-account-page', parent: HomeRoute.name)
        ]),
        _i7.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i7.RouteConfig(RegisterRoute.name, path: '/register-page'),
        _i7.RouteConfig(UserEditRoute.name, path: '/user-edit-page'),
        _i7.RouteConfig(CreatePostRoute.name, path: '/create-post-page'),
        _i7.RouteConfig(AuthUserDetailsRoute.name,
            path: '/auth-user-details-page'),
        _i7.RouteConfig(OtherUserAccountRoute.name,
            path: '/other-user-account-page'),
        _i7.RouteConfig(ChatRoute.name, path: '/chat-page'),
        _i7.RouteConfig(ChatsListRoute.name, path: '/chats-list-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegisterPage]
class RegisterRoute extends _i7.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-page');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i3.UserEditPage]
class UserEditRoute extends _i7.PageRouteInfo<UserEditRouteArgs> {
  UserEditRoute({_i8.Key? key, required _i10.UserModel? user})
      : super(UserEditRoute.name,
            path: '/user-edit-page',
            args: UserEditRouteArgs(key: key, user: user));

  static const String name = 'UserEditRoute';
}

class UserEditRouteArgs {
  const UserEditRouteArgs({this.key, required this.user});

  final _i8.Key? key;

  final _i10.UserModel? user;

  @override
  String toString() {
    return 'UserEditRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i3.CreatePostPage]
class CreatePostRoute extends _i7.PageRouteInfo<void> {
  const CreatePostRoute()
      : super(CreatePostRoute.name, path: '/create-post-page');

  static const String name = 'CreatePostRoute';
}

/// generated route for
/// [_i3.AuthUserDetailsPage]
class AuthUserDetailsRoute extends _i7.PageRouteInfo<void> {
  const AuthUserDetailsRoute()
      : super(AuthUserDetailsRoute.name, path: '/auth-user-details-page');

  static const String name = 'AuthUserDetailsRoute';
}

/// generated route for
/// [_i4.OtherUserAccountPage]
class OtherUserAccountRoute
    extends _i7.PageRouteInfo<OtherUserAccountRouteArgs> {
  OtherUserAccountRoute(
      {_i8.Key? key, required String id, required bool isCurrentUser})
      : super(OtherUserAccountRoute.name,
            path: '/other-user-account-page',
            args: OtherUserAccountRouteArgs(
                key: key, id: id, isCurrentUser: isCurrentUser));

  static const String name = 'OtherUserAccountRoute';
}

class OtherUserAccountRouteArgs {
  const OtherUserAccountRouteArgs(
      {this.key, required this.id, required this.isCurrentUser});

  final _i8.Key? key;

  final String id;

  final bool isCurrentUser;

  @override
  String toString() {
    return 'OtherUserAccountRouteArgs{key: $key, id: $id, isCurrentUser: $isCurrentUser}';
  }
}

/// generated route for
/// [_i5.ChatPage]
class ChatRoute extends _i7.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({_i8.Key? key, required _i11.ChatContact userModel})
      : super(ChatRoute.name,
            path: '/chat-page',
            args: ChatRouteArgs(key: key, userModel: userModel));

  static const String name = 'ChatRoute';
}

class ChatRouteArgs {
  const ChatRouteArgs({this.key, required this.userModel});

  final _i8.Key? key;

  final _i11.ChatContact userModel;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, userModel: $userModel}';
  }
}

/// generated route for
/// [_i6.ChatsListPage]
class ChatsListRoute extends _i7.PageRouteInfo<void> {
  const ChatsListRoute() : super(ChatsListRoute.name, path: '/chats-list-page');

  static const String name = 'ChatsListRoute';
}

/// generated route for
/// [_i3.PostsListPage]
class PostsListRoute extends _i7.PageRouteInfo<void> {
  const PostsListRoute() : super(PostsListRoute.name, path: 'posts-list-page');

  static const String name = 'PostsListRoute';
}

/// generated route for
/// [_i3.UsersListPage]
class UsersListRoute extends _i7.PageRouteInfo<void> {
  const UsersListRoute() : super(UsersListRoute.name, path: 'users-list-page');

  static const String name = 'UsersListRoute';
}

/// generated route for
/// [_i4.UserAccountPage]
class UserAccountRoute extends _i7.PageRouteInfo<UserAccountRouteArgs> {
  UserAccountRoute(
      {_i8.Key? key, required String id, required bool isCurrentUser})
      : super(UserAccountRoute.name,
            path: 'user-account-page',
            args: UserAccountRouteArgs(
                key: key, id: id, isCurrentUser: isCurrentUser));

  static const String name = 'UserAccountRoute';
}

class UserAccountRouteArgs {
  const UserAccountRouteArgs(
      {this.key, required this.id, required this.isCurrentUser});

  final _i8.Key? key;

  final String id;

  final bool isCurrentUser;

  @override
  String toString() {
    return 'UserAccountRouteArgs{key: $key, id: $id, isCurrentUser: $isCurrentUser}';
  }
}
