import 'package:flutter/material.dart';
import 'package:serviceprovder/pages/home_page.dart';
import 'package:serviceprovder/pages/login_page.dart';
import 'package:serviceprovder/style/style.dart';
import 'package:serviceprovder/widget/build_textfield.dart';
import 'package:serviceprovder/widget/login_register_btn.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(children: [
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
                  height: 15,
                ),
                const BuildTextField(hint: 'Full Name', icon: Icons.person),
                const SizedBox(
                  height: 15,
                ),
                const BuildTextField(hint: 'Username', icon: Icons.person),
                const SizedBox(
                  height: 15,
                ),
                const BuildTextField(hint: 'Email', icon: Icons.email),
                const SizedBox(
                  height: 15,
                ),
                const BuildTextField(hint: 'Password', icon: Icons.visibility),
                const SizedBox(
                  height: 15,
                ),
                const BuildTextField(hint: 'Contact Number', icon: Icons.call),
                const SizedBox(
                  height: 30,
                ),
                LoinRegisterButton(
                    tap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (__) {
                        return const HomePage();
                      }));
                    },
                    title: 'Sign up'),
                const SizedBox(
                  height: 15,
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
