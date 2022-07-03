// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/foundation.dart' as _i5;
import 'package:flutter/material.dart' as _i3;

import '../models/user_model.dart' as _i6;
import '../page/page.dart' as _i1;
import 'routes.dart' as _i4;

class AppRouter extends _i2.RootStackRouter {
  AppRouter(
      {_i3.GlobalKey<_i3.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i4.AuthGuard authGuard;

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    LoginRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.RegisterPage());
    },
    UserEditRoute.name: (routeData) {
      final args = routeData.argsAs<UserEditRouteArgs>();
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.UserEditPage(key: args.key, user: args.user));
    },
    CreatePostRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.CreatePostPage());
    },
    PostsListRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.PostsListPage());
    },
    UserAccountRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.UserAccountPage());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(HomeRoute.name, path: '/', guards: [
          authGuard
        ], children: [
          _i2.RouteConfig(PostsListRoute.name,
              path: 'posts-list-page', parent: HomeRoute.name),
          _i2.RouteConfig(UserAccountRoute.name,
              path: 'user-account-page', parent: HomeRoute.name)
        ]),
        _i2.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i2.RouteConfig(RegisterRoute.name, path: '/register-page'),
        _i2.RouteConfig(UserEditRoute.name, path: '/user-edit-page'),
        _i2.RouteConfig(CreatePostRoute.name, path: '/create-post-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute({List<_i2.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i2.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i1.RegisterPage]
class RegisterRoute extends _i2.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-page');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i1.UserEditPage]
class UserEditRoute extends _i2.PageRouteInfo<UserEditRouteArgs> {
  UserEditRoute({_i5.Key? key, required _i6.User? user})
      : super(UserEditRoute.name,
            path: '/user-edit-page',
            args: UserEditRouteArgs(key: key, user: user));

  static const String name = 'UserEditRoute';
}

class UserEditRouteArgs {
  const UserEditRouteArgs({this.key, required this.user});

  final _i5.Key? key;

  final _i6.User? user;

  @override
  String toString() {
    return 'UserEditRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i1.CreatePostPage]
class CreatePostRoute extends _i2.PageRouteInfo<void> {
  const CreatePostRoute()
      : super(CreatePostRoute.name, path: '/create-post-page');

  static const String name = 'CreatePostRoute';
}

/// generated route for
/// [_i1.PostsListPage]
class PostsListRoute extends _i2.PageRouteInfo<void> {
  const PostsListRoute() : super(PostsListRoute.name, path: 'posts-list-page');

  static const String name = 'PostsListRoute';
}

/// generated route for
/// [_i1.UserAccountPage]
class UserAccountRoute extends _i2.PageRouteInfo<void> {
  const UserAccountRoute()
      : super(UserAccountRoute.name, path: 'user-account-page');

  static const String name = 'UserAccountRoute';
}
