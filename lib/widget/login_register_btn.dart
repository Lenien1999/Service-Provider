import 'package:flutter/material.dart';

import '../style/style.dart';

class LoinRegisterButton extends StatelessWidget {
  final Function()? tap;
  final String title;

  const LoinRegisterButton({
    super.key,
    required this.tap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        height: 55,
        decoration: const BoxDecoration(
            color: primaryClr,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Center(
          child: Text(
            title,
            style: appstyle(Colors.white, FontWeight.bold, 16,
                'assets/fonts/WorkSans-ExtraBold.ttf'),
          ),
        ),
      ),
    );
  }
}
