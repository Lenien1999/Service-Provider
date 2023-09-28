import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/mainscreencontroller.dart';
import '../style/style.dart';
import 'booking_detail.dart';
import 'bottomNavigation.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  List<String> status = ['Booking', 'Pending', 'Completed'];
  String selectedStatus = 'Booking';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: primaryClr,
          leading: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (__) {
                  return BuildBottomNavigation();
                }));
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          title: Text(
            'Booking',
            style: appstyle(Colors.white, FontWeight.w500, 18, ''),
          ),
        ),
        body: Consumer<MainScreenController>(
          builder: (BuildContext context, value, Widget? child) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromRGBO(246, 247, 249, 1)),
                      height: 60,
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(15),
                            fillColor: Color.fromRGBO(246, 247, 249, 1)),
                        value: selectedStatus,
                        items: status
                            .map((statu) => DropdownMenuItem<String>(
                                value: statu,
                                child: Text(
                                  statu,
                                  style: appstyle(
                                      headingClr, FontWeight.w500, 16, ''),
                                )))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedStatus = value!;
                          });
                        },
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Your $selectedStatus List',
                    style: appstyle(headingClr, FontWeight.w500, 20, ''),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: value.cartItem.length,
                          itemBuilder: (context, index) {
                            final cartitem = value.cartItem[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const BookingDetails();
                                }));
                              },
                              child: Container(
                                margin: const EdgeInsets.all(20),
                                height: 510,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 235, 231, 231),
                                      style: BorderStyle.solid),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                              height: 190,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Image.asset(
                                                cartitem.service[index].images,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                fit: BoxFit.fill,
                                              )),
                                          Positioned(
                                              top: 20,
                                              left: 25,
                                              child: Container(
                                                  padding:
                                                      const EdgeInsets.all(6),
                                                  decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Text(
                                                    selectedStatus,
                                                    style: appstyle(
                                                        Colors.white,
                                                        FontWeight.bold,
                                                        12,
                                                        ''),
                                                  )))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            cartitem.service[index].name,
                                            style: appstyle(headingClr,
                                                FontWeight.w500, 20, ''),
                                          ),
                                          Text(
                                            '#123',
                                            style: appstyle(primaryClr,
                                                FontWeight.w500, 20, ''),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '\$${cartitem.service[index].price}',
                                            style: appstyle(primaryClr,
                                                FontWeight.w500, 20, ''),
                                          ),
                                          Text(
                                            '(5% off)',
                                            style: appstyle(Colors.green,
                                                FontWeight.w500, 20, ''),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  246, 247, 249, 1),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Column(
                                            children: [
                                              buildBookingContainer(
                                                  "Date", '23 OCT., 2023'),
                                              const Divider(
                                                height: 1,
                                                thickness: 0.3,
                                                color: Colors.grey,
                                                indent: 10,
                                              ),
                                              buildBookingContainer(
                                                  "Time", '2:30pm'),
                                              const Divider(
                                                height: 1,
                                                thickness: 0.3,
                                                color: Colors.grey,
                                                indent: 10,
                                              ),
                                              buildBookingContainer(
                                                  "Provider", 'Olamike Alade'),
                                              const Divider(
                                                height: 1,
                                                thickness: 0.3,
                                                color: Colors.grey,
                                                indent: 10,
                                              ),
                                              buildBookingContainer(
                                                  "Payment", 'Cash'),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }))
                ],
              ),
            );
          },
        ));
  }

  buildBookingContainer(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: appstyle(headingClr, FontWeight.w500, 14, ''),
          ),
          Text(
            subtitle,
            style: appstyle(titleClr, FontWeight.w500, 14, ''),
          ),
        ],
      ),
    );
  }
}
