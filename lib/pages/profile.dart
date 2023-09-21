import 'package:flutter/material.dart';

import '../style/style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: primaryClr,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: Text(
          'Profile',
          style: appstyle(Colors.white, FontWeight.w500, 18, ''),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    child: Image.asset(
                      'assets/images/avater1.png',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Positioned(
                      bottom: 0,
                      right: 2,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: primaryClr,
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Aminu Azeez Olamide',
                style: appstyle(headingClr, FontWeight.w700, 18, ''),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'olamide@gmail.com',
                style: appstyle(titleClr, FontWeight.w700, 14, ''),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
