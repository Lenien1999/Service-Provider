import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serviceprovder/controller/mainscreencontroller.dart';

import '../style/dottedline.dart';
import '../style/style.dart';

class BookServicePage extends StatefulWidget {
  const BookServicePage({super.key});

  @override
  State<BookServicePage> createState() => _BookServicePageState();
}

class _BookServicePageState extends State<BookServicePage> {
  List<Widget> pageList = [const BuildStepOne(), const BuildStepTwo()];
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

class BuildStepOne extends StatelessWidget {
  const BuildStepOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Enter Detail Information',
            style: appstyle(headingClr, FontWeight.w500, 18, '')),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: tilegClr,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text('Date And Time :',
                    style: appstyle(headingClr, FontWeight.w500, 14, '')),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(23)),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(12),
                      prefixIcon: Icon(
                        Icons.calendar_month,
                        color: titleClr,
                      ),
                      hintText: 'Enter Date And Time',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text('Your Address',
                    style: appstyle(headingClr, FontWeight.w500, 14, '')),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(23)),
                  child: TextFormField(
                    maxLines: 4,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                        color: titleClr,
                      ),
                      hintText: 'Enter your Address',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Use Current Location',
                        style: appstyle(primaryClr, FontWeight.w500, 14, '')),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
              color: primaryClr, borderRadius: BorderRadius.circular(12)),
          child: Center(
              child: Text(
            ' Next',
            style: appstyle(Colors.white, FontWeight.bold, 16, ''),
          )),
        ),
      ],
    );
  }
}

class BuildStepTwo extends StatelessWidget {
  const BuildStepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 128,
          padding:
              const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: tilegClr),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Apartment Cleaning',
                    style: appstyle(Colors.black, FontWeight.w500, 18, ''),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_drop_down)),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '1',
                          style: appstyle(titleClr, FontWeight.w500, 18, ''),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_drop_up)),
                      ],
                    ),
                  )
                ],
              ),
              Image.asset(
                'assets/images/home1.png',
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
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
              buildBookingContainer("Price", '#1200'),
              const Divider(
                height: 1,
                thickness: 0.3,
                color: Colors.grey,
                indent: 10,
              ),
              buildBookingContainer("Sub Total", '#1200*2'),
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
              buildBookingContainer("Total Amount", '#23000'),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 224, 219, 219),
                      width: 1),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                  child: Text(
                'Prevous',
                style: appstyle(Colors.black, FontWeight.bold, 16, ''),
              )),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                buildAlertBox(context);
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: primaryClr, borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Text(
                  ' Book',
                  style: appstyle(Colors.white, FontWeight.bold, 16, ''),
                )),
              ),
            ),
          ],
        ),
      ],
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

  buildAlertBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: SizedBox(
              height: 400,
              child: AlertDialog(
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/Check.png",
                      height: 60,
                      width: 60,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Confirm Booking',
                      style: appstyle(Colors.black, FontWeight.w500, 18, ''),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Are you sure you want to confirm the booking',
                      style: appstyle(headingClr, FontWeight.w500, 14, ''),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Cancel',
                              style: appstyle(
                                  Colors.black, FontWeight.bold, 18, ''),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 80,
                            decoration: BoxDecoration(
                                color: primaryClr,
                                borderRadius: BorderRadius.circular(12)),
                            child: TextButton(
                              onPressed: () {
                                buildConfirmBooking(context);
                              },
                              child: Text(
                                'Book',
                                style: appstyle(
                                    Colors.white, FontWeight.bold, 18, ''),
                              ),
                            ),
                          ),
                        ])
                  ],
                ),
              ),
            ),
          );
        });
  }

  buildConfirmBooking(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: SizedBox(
              height: 400,
              child: AlertDialog(
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/Check.png",
                      height: 60,
                      width: 60,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Booking Successful',
                      style: appstyle(Colors.black, FontWeight.w500, 18, ''),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'It is a long established fact that a reader will be distracted by the readable',
                      style: appstyle(headingClr, FontWeight.w500, 14, ''),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: primaryClr,
                          borderRadius: BorderRadius.circular(12)),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Back to Home',
                          style:
                              appstyle(Colors.white, FontWeight.bold, 18, ''),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
