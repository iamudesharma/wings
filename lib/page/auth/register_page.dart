// import 'dart:js';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:wings/models/user_model.dart';
import 'package:wings/provider/auth_provider.dart';
import 'package:wings/provider/user_provider/user_provider.dart';
import 'package:wings/utils/get_age.dart';
import 'package:wings/widgets/widgets.dart';

import '../../routes/routes.gr.dart';
import '../../widgets/textfield_widget.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  TextEditingController datetimeController = TextEditingController();

  int? age;

  void _DateTimePickers() async {
    final data = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime.now(),
    );

    setState(() {
      datetimeController.text = "${data!.day}/${data.month}/${data.year}";
      age = getAge(data);
    });
  }

  Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Consumer(builder: (context, ref, child) {
        final _auth = ref.watch(authProvider);

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Responsive(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    Consumer(builder: (context, ref, child) {
                      final _user = ref.watch(userRepository);
                      return textFormField(
                        usernameController,
                        onChanged: (value) async {
                          if (value.length > 3) {}
                        },
                        validator: (value) {
                          //user RegExp

                          if (value!.isEmpty) {
                            return 'Please enter a username';
                          } else {
                            return null;
                          }
                        },
                        hintText: 'Enter The  Username',
                        icon: Icons.person,
                        label: 'Username',
                        isPassword: false,
                        textInputAction: TextInputAction.next,
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    textFormField(
                      nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a name';
                        } else {
                          return null;
                        }
                      },
                      hintText: 'Enter The  Name',
                      icon: Icons.person,
                      label: 'Name',
                      isPassword: false,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 20,
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
                      height: 20,
                    ),
                    textFormField(
                      datetimeController,
                      readonly: true,
                      onTap: _DateTimePickers,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter The Date Of Birth';
                        }
                        return null;
                      },
                      hintText: 'Enter  Date Of Birth',
                      icon: Icons.date_range_outlined,
                      label: 'Date Of Birth',
                      isPassword: false,
                      textInputAction: TextInputAction.go,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomButton(
                      
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          if (_auth.isLoadingSignUp) {
                            return;
                          } else {
                            User _user = User(
                              name: nameController.text,
                              email: emailController.text,
                              age: age!,
                              bio: "",
                              country: "India",
                              dob: datetimeController.text,
                              id: "",
                              // isOnline: false,
                              photoUrl: "",
                              username: usernameController.text,
                            );
                            await _auth.signUp(
                              email: emailController.text,
                              password: passwordController.text,
                              user: _user,
                            );

                            context.router.navigate(const HomeRoute());
                          }
                        }
                      },
                      child: const Text('Register'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Have an account?',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            AutoRouter.of(context).pop();
                          },
                          child: const Text(
                            'Login',
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
        );
      }),
    );
  }
}
