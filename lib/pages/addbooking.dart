import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:serviceprovder/controller/mainscreencontroller.dart';

import '../model/servicemodel.dart';
 
import '../style/dottedline.dart';
import '../style/style.dart';
import '../widget/buildstepone.dart';
import '../widget/steptwo.dart';

class BookServicePage extends StatefulWidget {
  final Services serviceItem;
  const BookServicePage({super.key, required this.serviceItem});

  @override
  State<BookServicePage> createState() => _BookServicePageState();
}

class _BookServicePageState extends State<BookServicePage> {
  DateTime? selectedDateTime; // Store selected date
  String? selectedAddress; // Store selected address
  @override
  Widget build(BuildContext context) {
    List<Widget> pageList = [
      BuildStepOne(
          serviceItem: widget.serviceItem,
          onDateSelected: (date) {
            setState(() {
              selectedDateTime = date; // Update selected date
            });
          },
          onAddressSelected: (address) {
            setState(() {
              selectedAddress = address; // Update selected address
            });
          }),
      BuildStepTwo(
        serviceItem: widget.serviceItem,
        dateTime: selectedDateTime, // Pass the selected date
        address: selectedAddress, // Pass the selected address
      )
    ];
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
          'Book Service',
          style: appstyle(Colors.white, FontWeight.w500, 18, ''),
        ),
      ),
      body: Consumer<MainScreenController>(
        builder: (BuildContext context, value, child) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            value.bookingPage = 0;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: primaryClr, // Border color
                                width: 2.0, // Border width
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: value.bookingPage == 0
                                  ? primaryClr
                                  : Colors.white,
                              child: value.bookingPage == 1
                                  ? const Icon(
                                      Icons.done,
                                      color: primaryClr,
                                    )
                                  : Text('01',
                                      style: appstyle(
                                          value.bookingPage == 1
                                              ? primaryClr
                                              : Colors.white,
                                          FontWeight.w500,
                                          18,
                                          '')),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text('Step 1',
                            style: appstyle(
                                value.bookingPage == 1
                                    ? primaryClr
                                    : Colors.black,
                                FontWeight.w500,
                                14,
                                '')),
                      ],
                    ),
                    SizedBox(
                      width: 80, // Adjust the spacing between circles
                      child: CustomPaint(
                        size: const Size(20, 20), // Adjust the size of the line
                        painter: DottedLinePainter(),
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            value.bookingPage = 1;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: primaryClr, // Border color
                                width: 2.0, // Border width
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: value.bookingPage == 1
                                  ? primaryClr
                                  : Colors.white,
                              child: Text('02',
                                  style: appstyle(
                                      value.bookingPage == 1
                                          ? Colors.white
                                          : primaryClr,
                                      FontWeight.w500,
                                      18,
                                      '')),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text('Step 2',
                            style: appstyle(
                                value.bookingPage == 1
                                    ? Colors.black
                                    : primaryClr,
                                FontWeight.w600,
                                14,
                                '')),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                pageList[value.bookingPage]
              ],
            ),
          );
        },
      ),
    );
  }
}
