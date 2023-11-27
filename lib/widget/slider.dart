import 'package:flutter/material.dart';
import 'package:serviceprovder/pages/login_page.dart';

import '../model/slider_model.dart';
import '../style/style.dart';

class BuildSlider extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int currentpage;
  const BuildSlider({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.currentpage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Stack(
              children: [
                Positioned(
                    right: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Image.asset(
                        'assets/images/Circle.png',
                        fit: BoxFit.cover,
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(image))),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            title,
            style: appstyle(
                Colors.black, FontWeight.w500, 22, "WorkSans-Bold.ttf"),
          ),
          Text(
            description,
            maxLines: 2,
            style: appstyle(
                const Color.fromRGBO(
                  108,
                  117,
                  125,
                  1,
                ),
                FontWeight.w500,
                14,
                "WorkSans-Regular.ttf"),
          ),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ...List.generate(
                      sliderList.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: currentpage != index
                              ? const Color.fromRGBO(175, 176, 219, 1)
                              : const Color.fromRGBO(95, 96, 185, 1),
                        ),  
                      ),
                    ),
                  ],
                ),
                if (currentpage == 0)
                  Text(
                    'Get Started',
                    style: appstyle(const Color.fromRGBO(95, 96, 185, 1),
                        FontWeight.w500, 16, 'WorkSans-Regular.ttf'),
                  )
                else
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (__) {
                        return const LoginPage();
                      }));
                    },
                    child: Text(
                      'Skip',
                      style: appstyle(const Color.fromRGBO(95, 96, 185, 1),
                          FontWeight.w500, 16, 'WorkSans-Regular.ttf'),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
