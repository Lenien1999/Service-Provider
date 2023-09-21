import 'dart:async';

import 'package:flutter/material.dart';
import 'package:serviceprovder/style/style.dart';

import 'home_slider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (__) {
        return const HomeSlider();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/splash.png'),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Houseman User",
                style: appstyle(
                    primaryClr, FontWeight.w500, 30, "WorkSans-Regular.ttf"),
              )
            ],
          ),
        ));
  }
}
