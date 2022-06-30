import 'package:auto_route/annotations.dart' show AutoRoute, MaterialAutoRouter;
import 'package:auto_route/auto_route.dart';
import 'package:wings/main.dart';
import 'package:wings/page/home_page.dart';
import 'package:wings/page/auth/login_page.dart';
import 'package:wings/page/page.dart';
import 'package:wings/page/auth/register_page.dart';
import 'package:wings/page/users/user_account_page.dart';
import 'package:wings/provider/auth_provider.dart';
import 'package:wings/respositoryImpl/auth_respository_impl.dart';
import 'package:wings/routes/routes.gr.dart';


// @CupertinoAutoRouter()
@MaterialAutoRouter(
  // preferRelativeImports: ,
  replaceInRouteName: 'Page,Route',

  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true, guards: [
      AuthGuard
    ], children: [
      AutoRoute(
        page: PostsListPage,
      ),
      AutoRoute(
        page: CreatePostPage,
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
  ],
)
class $AppRouter {}

// class AuthGuard extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     // the navigation is paused until resolver.next() is called with either
//     // true to resume/continue navigation or false to abort navigation
//     //

//     Reader read ;
//     Provider(
//       ((ref) {
//         if (ref.read(authProvider).isLoggedIn() == true) {
//           resolver.next(true);
//         } else {
//           router.push(const LoginRoute());
//         }
//       }),
//     );
//   }
// }

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    AuthProvider authProvider = AuthProvider(AuthRespositoryImpl());

    if (authProvider.isLoggedIn() == true) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      router.push(const LoginRoute());
    }
  }
}
