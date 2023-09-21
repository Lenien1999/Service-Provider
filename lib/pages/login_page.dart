import 'package:flutter/material.dart';
import 'package:serviceprovder/pages/register_page.dart';
import 'package:serviceprovder/style/style.dart';
import 'package:serviceprovder/widget/build_textfield.dart';

import '../widget/login_register_btn.dart';
import 'bottomNavigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello Sara!",
              style: appstyle(
                  const Color.fromRGBO(
                    28,
                    31,
                    52,
                    1,
                  ),
                  FontWeight.w500,
                  22,
                  'assets/fonts/WorkSans-Regular.ttf'),
            ),
            Text(
              "Welcome Back, you have been\n missed for long Time",
              textAlign: TextAlign.center,
              style: appstyle(const Color.fromRGBO(108, 117, 125, 1),
                  FontWeight.w500, 16, 'assets/fonts/WorkSans-Medium.ttf'),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Form(
                    child: Column(
                  children: [
                    const BuildTextField(
                      hint: 'Email Address',
                      icon: Icons.email,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const BuildTextField(
                      hint: 'Password',
                      icon: Icons.visibility_off,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                checkColor:
                                    const Color.fromRGBO(95, 96, 185, 1),
                                value: value,
                                activeColor: Colors.red,
                                onChanged: (value) {
                                  setState(() {
                                    value = value;
                                  });
                                }),
                            Text(
                              'Remember Me',
                              style: appstyle(Colors.grey, FontWeight.w500, 12,
                                  'assets/fonts/WorkSans-Medium.ttf'),
                            ),
                          ],
                        ),
                        Text(
                          'Forgot Password?',
                          style: appstyle(
                              const Color.fromRGBO(95, 96, 185, 1),
                              FontWeight.w500,
                              12,
                              'assets/fonts/WorkSans-Regular.ttf'),
                        )
                      ],
                    )
                  ],
                )),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            LoinRegisterButton(
              tap: () {
                Navigator.push(context, MaterialPageRoute(builder: (__) {
                  return BuildBottomNavigation();
                }));
              },
              title: "Login",
            ),
            const SizedBox(
              height: 15,
            ),
            RichText(
                text: TextSpan(
                    text: "Don't have an account?",
                    style: appstyle(Colors.grey, FontWeight.w500, 14,
                        'assets/fonts/WorkSans-Regular.ttf'),
                    children: [
                  WidgetSpan(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (__) {
                        return const RegisterPage();
                      }));
                    },
                    child: const Text(' Sign Up',
                        style: TextStyle(
                            color: primaryClr,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontStyle: FontStyle.italic)),
                  ))
                ])),
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  width: 130,
                  child: Divider(
                    thickness: 2,
                    color: Color.fromRGBO(235, 235, 235, 1),
                  ),
                ),
                Text(
                  "Or Continue with",
                  style: appstyle(const Color.fromRGBO(108, 117, 125, 1),
                      FontWeight.w500, 14, 'assets/fonts/WorkSans-Regular.ttf'),
                ),
                const SizedBox(
                  width: 130,
                  child: Divider(
                    thickness: 2,
                    color: Color.fromRGBO(235, 235, 235, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: Color.fromRGBO(246, 247, 249, 1),
                  radius: 35,
                  child: Icon(
                    Icons.email_rounded,
                    color: Colors.redAccent,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                    backgroundColor: const Color.fromRGBO(246, 247, 249, 1),
                    radius: 35,
                    child: Image.asset(
                      'assets/images/Calling.png',
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
