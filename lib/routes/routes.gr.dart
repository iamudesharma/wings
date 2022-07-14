// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../models/user_model.dart' as _i7;
import '../page/auth/auth_user_detalis.dart' as _i3;
import '../page/auth/login_page.dart' as _i2;
import '../page/page.dart' as _i1;
import 'routes.dart' as _i6;

class AppRouter extends _i4.RootStackRouter {
  AppRouter(
      {_i5.GlobalKey<_i5.NavigatorState>? navigatorKey,
      required this.authGuard,
      required this.authUserDetailsGuard})
      : super(navigatorKey);

  final _i6.AuthGuard authGuard;

  final _i6.AuthUserDetailsGuard authUserDetailsGuard;

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    LoginRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.RegisterPage());
    },
    UserEditRoute.name: (routeData) {
      final args = routeData.argsAs<UserEditRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.UserEditPage(key: args.key, user: args.user));
    },
    CreatePostRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.CreatePostPage());
    },
    AuthUserDetailsRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.AuthUserDetailsPage());
    },
    PostsListRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.PostsListPage());
    },
    UserAccountRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.UserAccountPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(HomeRoute.name, path: '/', guards: [
          authGuard,
          authUserDetailsGuard
        ], children: [
          _i4.RouteConfig(PostsListRoute.name,
              path: 'posts-list-page', parent: HomeRoute.name),
          _i4.RouteConfig(UserAccountRoute.name,
              path: 'user-account-page', parent: HomeRoute.name)
        ]),
        _i4.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i4.RouteConfig(RegisterRoute.name, path: '/register-page'),
        _i4.RouteConfig(UserEditRoute.name, path: '/user-edit-page'),
        _i4.RouteConfig(CreatePostRoute.name, path: '/create-post-page'),
        _i4.RouteConfig(AuthUserDetailsRoute.name,
            path: '/auth-user-details-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i1.RegisterPage]
class RegisterRoute extends _i4.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-page');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i1.UserEditPage]
class UserEditRoute extends _i4.PageRouteInfo<UserEditRouteArgs> {
  UserEditRoute({_i5.Key? key, required _i7.User? user})
      : super(UserEditRoute.name,
            path: '/user-edit-page',
            args: UserEditRouteArgs(key: key, user: user));

  static const String name = 'UserEditRoute';
}

class UserEditRouteArgs {
  const UserEditRouteArgs({this.key, required this.user});

  final _i5.Key? key;

  final _i7.User? user;

  @override
  String toString() {
    return 'UserEditRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i1.CreatePostPage]
class CreatePostRoute extends _i4.PageRouteInfo<void> {
  const CreatePostRoute()
      : super(CreatePostRoute.name, path: '/create-post-page');

  static const String name = 'CreatePostRoute';
}

/// generated route for
/// [_i3.AuthUserDetailsPage]
class AuthUserDetailsRoute extends _i4.PageRouteInfo<void> {
  const AuthUserDetailsRoute()
      : super(AuthUserDetailsRoute.name, path: '/auth-user-details-page');

  static const String name = 'AuthUserDetailsRoute';
}

/// generated route for
/// [_i1.PostsListPage]
class PostsListRoute extends _i4.PageRouteInfo<void> {
  const PostsListRoute() : super(PostsListRoute.name, path: 'posts-list-page');

  static const String name = 'PostsListRoute';
}

/// generated route for
/// [_i1.UserAccountPage]
class UserAccountRoute extends _i4.PageRouteInfo<void> {
  const UserAccountRoute()
      : super(UserAccountRoute.name, path: 'user-account-page');

  static const String name = 'UserAccountRoute';
}
