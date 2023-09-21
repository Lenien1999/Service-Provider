import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serviceprovder/controller/controller.dart';

import '../model/slider_model.dart';
import '../widget/slider.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<PageNotifier>(
          builder: (context, activePage, child) {
            return PageView.builder(
                onPageChanged: (page) {
                  activePage.currentPage = page;
                },
                controller: controller,
                itemCount: sliderList.length,
                itemBuilder: ((context, index) {
                  final slider = sliderList[index];

                  return BuildSlider(
                    currentpage: activePage.currentPage,
                    description: slider.description,
                    image: slider.image,
                    title: slider.title,
                  );
                }));
          },
        ));
  }
}
