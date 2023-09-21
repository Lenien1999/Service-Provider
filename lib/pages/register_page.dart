import 'package:flutter/material.dart';
import 'package:serviceprovder/pages/home_page.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: primaryClr,
                radius: 50,
                child: Icon(
                  Icons.person_3_outlined,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Hello User !",
                style: appstyle(Colors.black, FontWeight.bold, 22,
                    'assets/fonts/WorkSans-Regular.ttf'),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Signup for better Experience",
                style: appstyle(titleClr, FontWeight.w500, 16,
                    'assets/fonts/WorkSans-Regular.ttf'),
              ),
              const SizedBox(
                height: 15,
              ),
              const SingleChildScrollView(
                child: Form(
                    child: Column(
                  children: [
                    BuildTextField(hint: 'Full Name', icon: Icons.person),
                    SizedBox(
                      height: 20,
                    ),
                    BuildTextField(hint: 'Username', icon: Icons.person),
                    SizedBox(
                      height: 20,
                    ),
                    BuildTextField(hint: 'Email', icon: Icons.email),
                    SizedBox(
                      height: 20,
                    ),
                    BuildTextField(hint: 'Password', icon: Icons.visibility),
                    SizedBox(
                      height: 20,
                    ),
                    BuildTextField(hint: 'Contact Number', icon: Icons.call),
                  ],
                )),
              ),
              const SizedBox(
                height: 40,
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
                      children: const [
                    TextSpan(
                        text: ' Sign in',
                        style: TextStyle(
                            color: primaryClr,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontStyle: FontStyle.italic)),
                  ])),
            ]),
      ),
    );
  }
}
