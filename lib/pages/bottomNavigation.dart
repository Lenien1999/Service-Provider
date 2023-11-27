import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:serviceprovder/controller/mainscreencontroller.dart';
import 'package:serviceprovder/pages/home_page.dart';
import 'package:serviceprovder/pages/provider/provider_home.dart';
import 'package:serviceprovder/pages/provider/servicegrid.dart';

import 'package:serviceprovder/style/style.dart';

import 'book_page.dart';

import 'profile.dart';

// ignore: must_be_immutable
class BuildBottomNavigation extends StatelessWidget {
  BuildBottomNavigation({super.key});

  List<Widget> pageList = [
    const HomePage(),
    const BookingPage(),
    const ServiceGrid(),
    const ProviderHome(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenController>(
      builder: (BuildContext context, mainscreenController, child) {
        return Scaffold(
          bottomNavigationBar: SafeArea(
              child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.09),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1))
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavWidget(
                  icon: mainscreenController.pageIndex == 0
                      ? Ionicons.home
                      : Ionicons.home_outline,
                  tap: () {
                    mainscreenController.pageIndex = 0;
                  },
                ),
                BottomNavWidget(
                  icon: mainscreenController.pageIndex == 1
                      ? Ionicons.ticket
                      : Ionicons.ticket_outline,
                  tap: () {
                    mainscreenController.pageIndex = 1;
                  },
                ),
                BottomNavWidget(
                  icon: mainscreenController.pageIndex == 2
                      ? Ionicons.grid
                      : Ionicons.grid_outline,
                  tap: () {
                    mainscreenController.pageIndex = 2;
                  },
                ),
                BottomNavWidget(
                  icon: mainscreenController.pageIndex == 3
                      ? Icons.email
                      : Icons.email_outlined,
                  tap: () {
                    mainscreenController.pageIndex = 3;
                  },
                ),
                BottomNavWidget(
                  icon: mainscreenController.pageIndex == 4
                      ? Ionicons.person
                      : Ionicons.person_outline,
                  tap: () {
                    mainscreenController.pageIndex = 4;
                  },
                ),
              ],
            ),
          )),
          body: pageList[mainscreenController.pageIndex],
        );
      },
    );
  }
}

class BottomNavWidget extends StatelessWidget {
  final void Function()? tap;
  final IconData icon;

  const BottomNavWidget({super.key, this.tap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: SizedBox(
        height: 42,
        width: 36,
        child: Icon(
          icon,
          color: primaryClr,
        ),
      ),
    );
  }
}
