import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serviceprovder/controller/mainscreencontroller.dart';
import 'package:serviceprovder/model/bookingmodel.dart';

import '../model/servicemodel.dart';
import '../style/dottedline.dart';
import '../style/style.dart';
import 'book_page.dart';

class BookServicePage extends StatefulWidget {
  final Services serviceItem;
  const BookServicePage({super.key, required this.serviceItem});

  @override
  State<BookServicePage> createState() => _BookServicePageState();
}

class _BookServicePageState extends State<BookServicePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> pageList = [
      const BuildStepOne(),
      BuildStepTwo(
        serviceItem: widget.serviceItem,
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

class BuildStepOne extends StatefulWidget {
  const BuildStepOne({
    super.key,
  });

  @override
  State<BuildStepOne> createState() => _BuildStepOneState();
}

class _BuildStepOneState extends State<BuildStepOne> {
  DateTime initialDate = DateTime.now();

  Future<DateTime?> showDateTimePicker({
    required BuildContext context,
  }) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: initialDate.subtract(const Duration(days: 365 * 100)),
      lastDate: initialDate
          .subtract(const Duration(days: 365 * 100))
          .add(const Duration(days: 365 * 200)),
    );

    if (selectedDate == null) return null;

    if (!context.mounted) return selectedDate;

    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDate),
    );

    return selectedTime == null
        ? selectedDate
        : DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            selectedTime.hour,
            selectedTime.minute,
          );
  }

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
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(12),
                      prefixIcon: GestureDetector(
                        onTap: () {
                          showDateTimePicker(
                            context: context,
                          );
                        },
                        child: const Icon(
                          Icons.calendar_month,
                          color: titleClr,
                        ),
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

class BuildStepTwo extends StatefulWidget {
  final Services serviceItem;
  const BuildStepTwo({super.key, required this.serviceItem});

  @override
  State<BuildStepTwo> createState() => _BuildStepTwoState();
}

class _BuildStepTwoState extends State<BuildStepTwo> {
  double subTotal = 0.0;

  updatePrice() {
    double total = 0.0;
    total += widget.serviceItem.price * widget.serviceItem.quantity;
    // double price = widget.serviceItem.price * widget.serviceItem.quantity;
    widget.serviceItem.discount = (total * 0.5);

    subTotal = total;
    widget.serviceItem.totalPrice = subTotal - widget.serviceItem.discount;
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState

    updatePrice();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenController>(
      builder: (BuildContext context, value, child) {
        final controller =
            Provider.of<MainScreenController>(context, listen: false);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 128,
              padding: const EdgeInsets.only(
                  top: 20, bottom: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: tilegClr),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        widget.serviceItem.name,
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
                                onPressed: () {
                                  if (widget.serviceItem.quantity > 1) {
                                    controller.decrement(widget.serviceItem);
                                    setState(() {
                                      updatePrice();
                                    });
                                  }
                                },
                                icon: const Icon(Icons.arrow_drop_down)),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.serviceItem.quantity.toString(),
                              style:
                                  appstyle(titleClr, FontWeight.w500, 18, ''),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            IconButton(
                                onPressed: () {
                                  controller.increment(widget.serviceItem);
                                  setState(() {
                                    updatePrice();
                                  });
                                  print(widget.serviceItem.price);
                                },
                                icon: const Icon(Icons.arrow_drop_up)),
                          ],
                        ),
                      )
                    ],
                  ),
                  Image.asset(
                    widget.serviceItem.images,
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
                  buildBookingContainer(
                      "Price", "\$${widget.serviceItem.price}"),
                  const Divider(
                    height: 1,
                    thickness: 0.3,
                    color: Colors.grey,
                    indent: 10,
                  ),
                  buildBookingContainer("Sub Total", "\$$subTotal"),
                  const Divider(
                    height: 1,
                    thickness: 0.3,
                    color: Colors.grey,
                    indent: 10,
                  ),
                  buildBookingContainer(
                      "Discout", "\$${widget.serviceItem.discount}"),
                  const Divider(
                    height: 1,
                    thickness: 0.3,
                    color: Colors.grey,
                    indent: 10,
                  ),
                  buildBookingContainer(
                      "Total Amount", "\$${widget.serviceItem.totalPrice}"),
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
                    buildAlertBox(context, widget.serviceItem);
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: primaryClr,
                        borderRadius: BorderRadius.circular(12)),
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
      },
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

  buildAlertBox(BuildContext context, Services serviceItem) {
    return showDialog(
        context: context,
        builder: (context) {
          return Consumer<MainScreenController>(
            builder: (BuildContext context, value, Widget? child) {
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
                          style:
                              appstyle(Colors.black, FontWeight.w500, 18, ''),
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
                                    var addServicetoCart = Booking(
                                        date: "date",
                                        time: "time",
                                        provider: [],
                                        service: [serviceItem]);

                                    value.addToCart(addServicetoCart);
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
            },
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
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (__) {
                            return const BookingPage();
                          }));
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
