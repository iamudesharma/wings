// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:wings/models/users/user_model.dart';
import 'package:wings/provider/auth_provider.dart';
import 'package:wings/routes/routes.gr.dart';
import 'package:wings/widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';
import '../../utils/get_age.dart';
import '../../widgets/textfield_widget.dart';

class AuthUserDetailsPage extends ConsumerStatefulWidget {
  const AuthUserDetailsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthUserDetailsPageState();
}

class _AuthUserDetailsPageState extends ConsumerState<AuthUserDetailsPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController datetimeController = TextEditingController();

  int? age;

  // ignore: non_constant_identifier_names
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
    return Scaffold(
      appBar: AppBar(
        title: Text("User Additionl Details"),
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textFormField(
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
                ),
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
                  phoneController,
                  validator: (value) {
                    //Email RegExp
                    if (value!.isEmpty) {
                      return 'Please Enter The Phone Number';
                    } else {
                      return null;
                    }
                  },
                  hintText: 'Enter The  Phone No.',
                  icon: Icons.phone,
                  label: 'Phone',
                  isPassword: false,
                  textInputAction: TextInputAction.next,
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
                    child: const Text("Add"),
                    onTap: () async {
                      final playerId = await OneSignal().getDeviceState();

                      final user = UserModel(
                        fcmToken: playerId!.userId!,
                        username: usernameController.text,
                        email: "",
                        photoUrl: "",
                        country: "India",
                        bio: "",
                        id: "",
                        name: nameController.text,
                        age: age!,
                        dob: datetimeController.text,
                        phone: int.parse(
                          phoneController.text,
                        ),
                      );

                      await ref
                          .read(authRepositoryProvider)
                          .userAdditionalDetails(user);
                      if (!mounted) {}

                      context.navigateTo(const HomeRoute());
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
