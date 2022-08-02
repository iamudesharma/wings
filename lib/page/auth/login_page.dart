import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:wings/models/users/user_model.dart';
import 'package:wings/provider/auth_provider.dart';
import 'package:wings/provider/local_data.dart';
import 'package:wings/routes/routes.gr.dart';
import 'package:wings/widgets/widgets.dart';
import 'package:auth_buttons/auth_buttons.dart';

// import '../../widgets/textfield_widget.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ConsumerState<LoginPage> {
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _auth = ref.watch(authProvider);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Responsive(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!Platform.isMacOS)
                        GoogleAuthButton(
                          onPressed: () async {
                            await ref
                                .read(authRepositoryProvider)
                                .googleSignIn()
                                .then((value) => context.navigateTo(
                                      HomeRoute(),
                                    ))
                                .onError(
                                  (error, stackTrace) => print(
                                    error.toString(),
                                  ),
                                );
                          },
                          // darkMode: true,
                          themeMode: ThemeMode.dark,
                        ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'W',
                            style: TextStyle(
                              letterSpacing: 2.0,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                            children: [
                              TextSpan(
                                  text: "ings",
                                  style: Theme.of(context).textTheme.headline3)
                            ]),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      textFormField(
                        emailController,
                        validator: (value) {
                          //Email RegExp
                          if (value!.isEmpty) {
                            return 'Please Enter The Email';
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return 'Please Enter The Valid Email';
                          } else {
                            return null;
                          }
                        },
                        hintText: 'Enter The  Email',
                        icon: Icons.email,
                        label: 'Email',
                        isPassword: false,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      textFormField(
                        passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter The Password';
                          } else if (value.length < 6) {
                            return 'Password Must Be At Least 6 Characters';
                          }
                          return null;
                        },
                        hintText: 'Enter The  Password',
                        icon: Icons.password,
                        label: 'Password',
                        isPassword: true,
                        textInputAction: TextInputAction.go,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomButton(
                        onTap: () async {
                          final playerId = await OneSignal().getDeviceState();
                          if (_formKey.currentState!.validate()) {
                            if (_auth.isLoading) {
                              return;
                            } else {
                              await _auth.login(
                                  email: emailController.text,
                                  password: passwordController.text);

                              await usersRef.doc(SharedPref.getUid()).update(
                                    fcmToken: playerId!.userId!,
                                  );

                              context.router.replace(const HomeRoute());
                            }
                          }
                        },
                        child: _auth.isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : const Text('Login'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              context.router.push(const RegisterRoute());
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
