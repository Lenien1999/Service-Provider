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
            height: MediaQuery.of(context).size.height * 0.32,
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
          ),
          Container(
            color: tilegClr,
            padding: const EdgeInsets.all(17),
            child: Text(
              'General',
              style: appstyle(primaryClr, FontWeight.w700, 16, ''),
            ),
          ),
          Column(
            children: [
              buildContainer('Change Password', Icons.lock),
              buildContainer('App Language', Icons.language),
              buildContainer(
                  'Favourite Service', Icons.favorite_border_outlined),
              buildContainer('Rate Us', Icons.star),
            ],
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: primaryClr, borderRadius: BorderRadius.circular(12)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Logout',
                  style: appstyle(Colors.white, FontWeight.bold, 18, ''),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  buildContainer(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: titleClr,
                size: 20,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                title,
                style: appstyle(titleClr, FontWeight.w600, 16, ''),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            color: titleClr,
          )
        ],
      ),
    );
  }
}
