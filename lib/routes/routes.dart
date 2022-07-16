import 'package:auto_route/annotations.dart' show AutoRoute, MaterialAutoRouter;
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings/page/auth/auth_user_detalis.dart';
import 'package:wings/page/auth/login_page.dart';
import 'package:wings/page/auth/register_page.dart';
import 'package:wings/page/home_page.dart';
import 'package:wings/page/page.dart';
import 'package:wings/page/users/user_account_page.dart';
import 'package:wings/page/users/users_list_page.dart';
import 'package:wings/provider/auth_provider.dart';
import 'package:wings/respositoryImpl/auth_respository_impl.dart';
import 'package:wings/respositoryImpl/user_respository_impl.dart';
import 'package:wings/routes/routes.gr.dart';

// @CupertinoAutoRouter()
@MaterialAutoRouter(
  // preferRelativeImports: ,
  replaceInRouteName: 'Page,Route',

  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true, guards: [
      AuthGuard,
      AuthUserDetailsGuard,
    ], children: [
      AutoRoute(
        page: PostsListPage,
      ),
      AutoRoute(
        page: UsersListPage,
      ),
      AutoRoute(
        page: UserAccountPage,
      ),
    ]),
    AutoRoute(
      page: LoginPage,
    ),
    AutoRoute(
      page: RegisterPage,
    ),
    AutoRoute(
      page: UserEditPage,
    ),
    AutoRoute(
      page: CreatePostPage,
    ),
    AutoRoute(
      page: AuthUserDetailsPage,
    ),
    AutoRoute(
      page: OtherUserAccountPage,
    ),
  ],
)
class $AppRouter {}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    AuthProvider authProvider =
        AuthProvider(AuthRespositoryImpl(), UserRepositoryImpl());

    if (authProvider.isLoggedIn() == true) {
      resolver.next(true);

      // if user is authenticated we continue
    } else {
      // we redirect the user to our login page
      router.navigate(const LoginRoute());
    }
  }
}

class AuthUserDetailsGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    AuthProvider authProvider =
        AuthProvider(AuthRespositoryImpl(), UserRepositoryImpl());

    if (await authProvider.checkUserExists() == true) {
      resolver.next(true);
    } else {
      router.navigate(const AuthUserDetailsRoute());
    }
    // if user is authenticated we continue
  }
}
