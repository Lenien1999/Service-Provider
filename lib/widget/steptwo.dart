import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/mainscreencontroller.dart';
import '../model/bookingmodel.dart';
import '../model/servicemodel.dart';
import '../pages/book_page.dart';
import '../style/style.dart';

class BuildStepTwo extends StatefulWidget {
  final String? address;
  final DateTime ?dateTime;
  final Services serviceItem;
  const BuildStepTwo(
      {super.key, required this.serviceItem,  this.address,  this.dateTime});

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
                    buildAlertBox(context, widget.serviceItem, widget.dateTime
                       );
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

  buildAlertBox(BuildContext context, Services serviceItem, DateTime? dateTime,
     ) {
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
                                        date: dateTime,
                                        provider: [],
                                        service: [
                                          Services(
                                              location: serviceItem.location,
                                              name: serviceItem.name,
                                              heading: serviceItem.heading,
                                              description:
                                                  serviceItem.description,
                                              price: serviceItem.price,
                                              images: serviceItem.images)
                                        ]);

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
