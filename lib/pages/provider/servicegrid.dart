import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:serviceprovder/model/servicemodel.dart';

import '../../style/style.dart';

import '../service_detail.dart';

// ignore: camel_case_types
class ServiceGrid extends StatefulWidget {
  const ServiceGrid({super.key});

  @override
  State<ServiceGrid> createState() => _ServiceGridState();
}

class _ServiceGridState extends State<ServiceGrid> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
            'Service List',
            style: appstyle(Colors.white, FontWeight.w500, 18, ''),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(246, 247, 249, 1),
                  hintText: 'Search here',
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: serviceList.length,
                itemBuilder: (context, index) {
                  final serviceItem = serviceList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ServiceDetails(serviceItem: serviceItem);
                      }));
                    },
                    child:
                     Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
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
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 100,
                            child: Stack(
                              children: [
                                Image.asset(
                                  serviceItem.images,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height: 90,
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
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.0, horizontal: 10),
                                        child: Text(
                                          '\$190',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ))
                              ],
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
                                  itemSize: 15,
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
                                style: appstyle(
                                    Colors.grey, FontWeight.bold, 14, ''),
                              )
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 180,
                                child: Text(
                                  'Painting for beautiful home',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: appstyle(
                                      const Color.fromRGBO(28, 31, 52, 1),
                                      FontWeight.w500,
                                      16,
                                      ''),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                      radius: 20,
                                      child: Image.asset(
                                          'assets/images/avater.png')),
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
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
