import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serviceprovder/firebaseController/firbaseAuth/auth_controller.dart';

import 'package:serviceprovder/pages/login_page.dart';
import 'package:serviceprovder/style/style.dart';
import 'package:serviceprovder/widget/build_textfield.dart';
import 'package:serviceprovder/widget/login_register_btn.dart';

import '../backend/firebase_method.dart';
import '../component/utilitiy.dart';
import '../firebaseController/firbaseAuth/auth_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _selectedRole = 'customer';
  final _key = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final pnum = TextEditingController();
  final fullname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context, listen: false);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _key,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: primaryClr,
                      radius: 40,
                      child: Icon(
                        Icons.person_3_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Hello User !",
                      style: appstyle(Colors.black, FontWeight.bold, 22,
                          'assets/fonts/WorkSans-Regular.ttf'),
                    ),
                    Text(
                      "Signup for better Experience",
                      style: appstyle(titleClr, FontWeight.w500, 16,
                          'assets/fonts/WorkSans-Regular.ttf'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BuildTextField(
                        controller: fullname,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an Full Name';
                          } else {
                            return null;
                          }
                        },
                        hint: 'Full Name',
                        icon: Icons.person),
                    const SizedBox(
                      height: 10,
                    ),
                    BuildTextField(
                        controller: email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          }
                          // Use RegExp for basic email validation
                          if (!RegExp(
                                  r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
                              .hasMatch(value)) {
                            return 'Enter a valid email';
                          }

                          return null; // Return null if the input is valid
                        },
                        hint: 'Email',
                        icon: Icons.email),
                    const SizedBox(
                      height: 10,
                    ),
                    BuildTextField(
                        controller: password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password lenght should greater than 6';
                          } else {
                            return null;
                          }
                        },
                        hint: 'Password',
                        icon: Icons.visibility),
                    const SizedBox(
                      height: 10,
                    ),
                    BuildTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your number';
                        } else {
                          return null;
                        }
                      },
                      hint: 'Contact Number',
                      icon: Icons.call,
                      controller: pnum,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: DropdownButtonFormField<String>(
                          value: _selectedRole,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedRole = value!;
                            });
                          },
                          items: ['customer', 'provider'].map((String role) {
                            return DropdownMenuItem<String>(
                              value: role,
                              child: Text(
                                role,
                                style: const TextStyle(
                                  color: primaryClr,
                                ),
                              ),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LoinRegisterButton(
                        tap: () async {
                          if (_key.currentState!.validate()) {
                            await authController.registerUser(
                                email: email.text.trim(),
                                password: password.text.trim(),
                                context: context);
                          }
                          // Check if the user is successfully registered
                          if (authController.fireBaseUser != null) {
                            final user = UserModel(
                                id: authController.fireBaseUser!.uid,
                                fullName: fullname.text,
                                email: email.text,
                                phoneNo: pnum.text,
                                role: _selectedRole);

                            // Store additional user information in Firestore
                            await FirebaseMethod().addUserData(user);
                            Utils().onSuccess('Your account has been created');
                          } else {
                            Utils().onError('An Error has occured');
                          }
                        },
                        title: 'Sign up'),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                        text: TextSpan(
                            text: "Already have an account?",
                            style: appstyle(Colors.grey, FontWeight.w500, 14,
                                'assets/fonts/WorkSans-Regular.ttf'),
                            children: [
                          WidgetSpan(
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (__) {
                                    return const LoginPage();
                                  }));
                                },
                                child: const Text(' Sign in',
                                    style: TextStyle(
                                        color: primaryClr,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic))),
                          )
                        ])),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
