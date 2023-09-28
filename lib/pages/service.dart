import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:serviceprovder/model/category_model.dart';
import 'package:serviceprovder/model/servicemodel.dart';

import 'package:serviceprovder/pages/filter_page.dart';
import '../style/style.dart';
import 'service_detail.dart';

class ServicePage extends StatefulWidget {
  final Category services;
  
  const ServicePage(
      {super.key, required this.services,});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  final serviceCategory = [
    'All',
    'Wall Painting',
    'Home Painting',
    'Car Painting'
  ];
  final controller = TextEditingController();
    List<Services> searchServiceList = List.from(serviceList);
  void updatSearchList(String value) {
    setState(() {
      searchServiceList.where((element) {
        final search =
            element.name.toLowerCase().contains(value.toLowerCase()) ||
                element.description.toLowerCase().contains(value.toLowerCase());
        return search;
      }).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    final String category = widget.services.name;
    int itemCount = categoryList
        .where((element) =>
            element.service.any((servic) => servic.name == category))
        .toList()
        .length;

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
          widget.services.name,
          style: appstyle(Colors.white, FontWeight.w500, 18, ''),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  controller: controller,
                  onChanged: (value) {
                    updatSearchList(value);
                  },
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      border: InputBorder.none,
                      fillColor: Color.fromRGBO(246, 247, 249, 1),
                      filled: true,
                      hintText: 'Search here',
                      prefixIcon: Icon(Icons.search)),
                ),
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: primaryClr, borderRadius: BorderRadius.circular(10)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (__) {
                      return const FilterPage();
                    }));
                  },
                  child: const Icon(
                    Ionicons.filter_sharp,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 60,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: List.generate(serviceCategory.length, (index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(246, 247, 249, 1)),
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                    child: Text(
                      serviceCategory[index],
                      style: appstyle(const Color.fromRGBO(108, 117, 125, 1),
                          FontWeight.w600, 14, ''),
                    ),
                  ),
                );
              }),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                final filterservice = serviceList
                    .where((element) => element.name == category)
                    .toList();
                final serviceItem = filterservice[index];
                return Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 2,
                          spreadRadius: 1,
                        )
                      ],
                      border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(255, 224, 222, 222)),
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromRGBO(246, 247, 249, 1)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 175,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ServiceDetails(
                                serviceItem: serviceItem);
                            }));
                          },
                          child: Stack(
                            children: [
                              Image.asset(
                                serviceItem.images,
                                fit: BoxFit.fill,
                                height: 160,
                                width: MediaQuery.of(context).size.width,
                              ),
                              Positioned(
                                  left: 10,
                                  top: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: primaryClr, width: 1),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(23),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        serviceItem.name,
                                        style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: primaryClr),
                                      ),
                                    ),
                                  )),
                              Positioned(
                                  right: 20,
                                  bottom: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 1),
                                      color: primaryClr,
                                      borderRadius: BorderRadius.circular(23),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 10),
                                      child: Text(
                                        "\$${serviceItem.price}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                              initialRating: 4,
                              minRating: 1,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 1),
                              itemSize: 20,
                              direction: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return const Icon(
                                  Icons.star,
                                  color: Color.fromRGBO(255, 189, 0, 1),
                                );
                              },
                              onRatingUpdate: (rating) {}),
                          Text(
                            "4.3",
                            style:
                                appstyle(Colors.grey, FontWeight.bold, 14, ''),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 310,
                          child: Text(
                            serviceItem.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: appstyle(const Color.fromRGBO(28, 31, 52, 1),
                                FontWeight.w500, 16, ''),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                                radius: 20,
                                child: Image.asset('assets/images/avater.png')),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Aminu Azeez',
                              style: appstyle(
                                  const Color.fromRGBO(108, 117, 125, 1),
                                  FontWeight.w600,
                                  14,
                                  ''),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              })
        ]),
      ),
    );
  }


}
