import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:serviceprovder/model/bookingmodel.dart';
import 'package:serviceprovder/model/review.dart';

import '../model/servicemodel.dart';
import '../style/style.dart';

class BookingDetails extends StatelessWidget {
  final Services service;
  final Booking cartItem;
  const BookingDetails(
      {super.key, required this.service, required this.cartItem});

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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Check Status',
              style: appstyle(Colors.white, FontWeight.w500, 14, ''),
            ),
          ),
        ],
        title: Text(
          'Pending',
          style: appstyle(Colors.white, FontWeight.w500, 16, ''),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Booking Id',
                    style: appstyle(titleClr, FontWeight.w500, 20, ''),
                  ),
                  Text(
                    '#123',
                    style: appstyle(primaryClr, FontWeight.w500, 20, ''),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
              color: Color.fromRGBO(235, 235, 235, 1),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        service.name,
                        style: appstyle(headingClr, FontWeight.w500, 18, ''),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                          text: TextSpan(
                              text: 'Date:',
                              style:
                                  appstyle(headingClr, FontWeight.w500, 14, ''),
                              children: [
                            TextSpan(
                                text: DateFormat('MMMM-dd-yyyy')
                                    .format(cartItem.date!),
                                style:
                                    appstyle(titleClr, FontWeight.w500, 14, ''))
                          ])),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                          text: TextSpan(
                              text: 'Time:',
                              style:
                                  appstyle(headingClr, FontWeight.w500, 14, ''),
                              children: [
                            TextSpan(
                                text:
                                    DateFormat('HH-mm').format(cartItem.date!),
                                style:
                                    appstyle(titleClr, FontWeight.w500, 14, ''))
                          ])),
                    ],
                  ),
                  Image.asset(service.images,
                      fit: BoxFit.cover, height: 100, width: 100)
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Duration:',
              style: appstyle(headingClr, FontWeight.w500, 18, ''),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                color: const Color.fromRGBO(246, 247, 249, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Service Taken Time',
                    style: appstyle(headingClr, FontWeight.w500, 14, ''),
                  ),
                  Text(
                    '35 Min',
                    style: appstyle(titleClr, FontWeight.w500, 14, ''),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'House Man',
              style: appstyle(headingClr, FontWeight.w500, 18, ''),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
              decoration: BoxDecoration(
                  color: tilegClr, borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: CircleAvatar(
                      radius: 60,
                      child: Image.asset(
                        'assets/images/avater1.png',
                        height: 60,
                        width: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: Text(
                      "Leslie Alexander",
                      style: appstyle(headingClr, FontWeight.w600, 18, ''),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cleaning Expert",
                          style: appstyle(headingClr, FontWeight.w500, 14, ''),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            RatingBar.builder(
                                itemCount: 5,
                                itemSize: 20,
                                initialRating: 4,
                                minRating: 1,
                                direction: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  );
                                },
                                onRatingUpdate: (rating) {}),
                            const SizedBox(width: 10),
                            Text(
                              '4.5',
                              style:
                                  appstyle(headingClr, FontWeight.w500, 16, ''),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(primaryClr)),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.call_outlined,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Call ',
                          style:
                              appstyle(Colors.white, FontWeight.w500, 18, ''),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.send_and_archive_outlined,
                          color: Colors.black,
                        ),
                        label: Text(
                          'Chat ',
                          style:
                              appstyle(Colors.black, FontWeight.w500, 18, ''),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Rate Houseman ',
                    style: appstyle(primaryClr, FontWeight.w500, 14, ''),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: primaryClr, borderRadius: BorderRadius.circular(12)),
              child: Center(
                  child: Text(
                'Cancel Booking',
                style: appstyle(Colors.white, FontWeight.bold, 16, ''),
              )),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Price Deteil',
              style: appstyle(headingClr, FontWeight.w500, 18, ''),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(246, 247, 249, 1),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  buildBookingContainer("Price", service.price.toString()),
                  const Divider(
                    height: 1,
                    thickness: 0.3,
                    color: Colors.grey,
                    indent: 10,
                  ),
                  buildBookingContainer(
                      "Sub Total", service.discount.toString()),
                  const Divider(
                    height: 1,
                    thickness: 0.3,
                    color: Colors.grey,
                    indent: 10,
                  ),
                  buildBookingContainer("Discout", '-#50'),
                  const Divider(
                    height: 1,
                    thickness: 0.3,
                    color: Colors.grey,
                    indent: 10,
                  ),
                  buildBookingContainer(
                      "Total Amount", service.totalPrice.toString()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Review",
                    style: appstyle(Colors.black, FontWeight.w500, 18, ''),
                  ),
                  Text(
                    "View all",
                    style: appstyle(titleClr, FontWeight.w500, 14, ''),
                  )
                ],
              ),
            ),
            ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: CircleAvatar(
                  radius: 60,
                  child: Image.asset(
                    'assets/images/avater1.png',
                    height: 60,
                    width: 60,
                    fit: BoxFit.fill,
                  ),
                ),
                title: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Leslie Alexander",
                          style: appstyle(headingClr, FontWeight.w600, 20, ''),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "02 Dec",
                          style: appstyle(headingClr, FontWeight.w600, 12, ''),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        RatingBar.builder(
                            itemCount: 5,
                            itemSize: 20,
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              );
                            },
                            onRatingUpdate: (rating) {}),
                        const SizedBox(width: 10),
                        Text(
                          '4.5',
                          style: appstyle(headingClr, FontWeight.w500, 16, ''),
                        )
                      ],
                    ),
                  ],
                ),
                subtitle: Text(
                  "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet",
                  style: appstyle(headingClr, FontWeight.w500, 14, ''),
                ),
                trailing: Text(
                  'Edit',
                  style: appstyle(primaryClr, FontWeight.w500, 12, ''),
                )),
          ],
        ),
      ),
    );
  }

  buildBookingContainer(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: appstyle(headingClr, FontWeight.bold, 16, ''),
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
