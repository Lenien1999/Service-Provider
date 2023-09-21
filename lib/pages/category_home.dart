import 'package:flutter/material.dart';
import 'package:serviceprovder/style/style.dart';

import '../model/category_model.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

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
          'Category',
          style: appstyle(Colors.white, FontWeight.w500, 18, ''),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView.builder(
            itemCount: categoryList.length,
            gridDelegate: (const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 15, crossAxisSpacing: 30, crossAxisCount: 2)),
            itemBuilder: (context, index) {
              return Container(
                height: 154,
                width: 157,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(255, 238, 232, 232),
                        blurRadius: 1,
                        spreadRadius: 1)
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      color: const Color.fromRGBO(235, 235, 235, 1),
                      child: Image.asset(
                        categoryList[index].image,
                        height: 80,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        categoryList[index].name,
                        style: appstyle(titleClr, FontWeight.w600, 16, ''),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
