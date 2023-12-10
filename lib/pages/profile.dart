import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../backend/firebase_method.dart';
import '../firebaseController/firbaseAuth/auth_controller.dart';
import '../firebaseController/firbaseAuth/auth_model.dart';
import '../style/style.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  UserModel? _userData;
  Future<void> _getCurrentUser() async {
    final userController = Provider.of<AuthController>(context, listen: false);
    await _fetchUserData(userController.fireBaseUser!.uid);
  }

  Future<void> _fetchUserData(String userId) async {
    try {
      FirebaseMethod firebaseMethod = FirebaseMethod();
      UserModel? userData = await firebaseMethod.getUserData(userId);
      setState(() {
        _userData = userData;
      });
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

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
        body:
            Consumer<AuthController>(builder: (context, userController, child) {
          return ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.32,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                        _userData?.fullName ?? 'Aminu Azeez Olamide',
                        style: appstyle(headingClr, FontWeight.w700, 18, ''),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        _userData?.email ?? 'olamide@gmail.com',
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
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: primaryClr,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextButton(
                    onPressed: () async {
                      await userController.logout();
                    },
                    child: Text(
                      'Logout',
                      style: appstyle(Colors.white, FontWeight.bold, 18, ''),
                    ),
                  ),
                ),
              )
            ],
          );
        }));
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
