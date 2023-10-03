import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:serviceprovder/pages/addbooking.dart';
import 'package:serviceprovder/style/style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../model/review.dart';
import '../model/servicemodel.dart';
import '../widget/login_register_btn.dart';

class ServiceDetails extends StatefulWidget {
  final Services serviceItem;
  const ServiceDetails({super.key, required this.serviceItem});

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  TextEditingController reviewController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed.
    reviewController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0x00f6f7f9),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: size.height,
            flexibleSpace: FlexibleSpaceBar(
              background: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: size.height * 0.5,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: size.height * 0.39,
                          width: size.width,
                          child: Image.asset(
                            widget.serviceItem.images,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            left: 20,
                            right: 20,
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.09),
                                        blurRadius: 1,
                                        offset: Offset(0, 1),
                                        spreadRadius: 2)
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Electronics',
                                          style: appstyle(primaryClr,
                                              FontWeight.w500, 16, ''),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color:
                                              Color.fromRGBO(108, 117, 125, 1),
                                        ),
                                        Text(
                                          'Installation',
                                          style: appstyle(
                                              const Color.fromRGBO(
                                                  108, 117, 125, 1),
                                              FontWeight.w500,
                                              16,
                                              ''),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      widget.serviceItem.name,
                                      style: appstyle(Colors.black,
                                          FontWeight.w600, 22, ''),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                              text:
                                                  ' \$${widget.serviceItem.price}',
                                              style: appstyle(primaryClr,
                                                  FontWeight.bold, 22, ''),
                                              children: [
                                                TextSpan(
                                                    text: ' 10% off',
                                                    style: appstyle(
                                                        const Color.fromRGBO(
                                                            108, 117, 125, 1),
                                                        FontWeight.w600,
                                                        14,
                                                        ''))
                                              ]),
                                        )
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
                                          'Duration:',
                                          style: appstyle(Colors.black,
                                              FontWeight.w500, 14, ''),
                                        ),
                                        Text(
                                          '1 hour',
                                          style: appstyle(primaryClr,
                                              FontWeight.w500, 14, ''),
                                        ),
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
                                          'Rating:',
                                          style: appstyle(Colors.black,
                                              FontWeight.w500, 14, ''),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              size: 20,
                                              color: Colors.amber,
                                            ),
                                            Text(
                                              '4.5',
                                              style: appstyle(primaryClr,
                                                  FontWeight.w500, 14, ''),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )),
                        const Positioned(
                            top: 10,
                            right: 10,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Ionicons.heart_circle_outline,
                                color: Colors.grey,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: appstyle(const Color.fromRGBO(28, 31, 52, 1),
                              FontWeight.w500, 18, ''),
                        ),
                        Text(
                          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: appstyle(
                              const Color.fromRGBO(108, 117, 125, 1),
                              FontWeight.w500,
                              14,
                              ''),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Available At",
                          style:
                              appstyle(Colors.black, FontWeight.bold, 18, ''),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                              widget.serviceItem.location.length, (index) {
                            final selected =
                                index == widget.serviceItem.isSelectedLocation;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.serviceItem.isSelectedLocation = index;
                                });
                              },
                              child: Container(
                                height: 40,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    color: selected
                                        ? primaryClr
                                        : const Color.fromARGB(
                                            255, 221, 224, 228)),
                                child: Center(
                                  child: Text(
                                    widget.serviceItem.location[index],
                                    style: appstyle(
                                        selected
                                            ? Colors.white
                                            : const Color.fromARGB(
                                                255, 139, 137, 137),
                                        FontWeight.w600,
                                        16,
                                        ''),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(246, 247, 249, 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  leading: CircleAvatar(
                                    radius: 60,
                                    child: Image.asset(
                                      'assets/images/avater.png',
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  title: Text(
                                    "Leslie Alexander",
                                    style: appstyle(
                                        headingClr, FontWeight.w600, 20, ''),
                                  ),
                                  subtitle: Row(
                                    children: [
                                      RatingBar.builder(
                                          itemCount: 5,
                                          itemSize: 20,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            );
                                          },
                                          onRatingUpdate: (rating) {}),
                                      Text(
                                        '4.5',
                                        style: appstyle(headingClr,
                                            FontWeight.w500, 16, ''),
                                      )
                                    ],
                                  ),
                                  trailing: const Icon(Icons.verified,
                                      color: Colors.green),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.email_outlined,
                                      color: headingClr,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'example@gmail.com',
                                      style: appstyle(
                                          headingClr, FontWeight.w500, 14, ''),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: headingClr,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '1901 Thornridge Cir. Shiloh, Hawaii...',
                                      style: appstyle(
                                          headingClr, FontWeight.w500, 14, ''),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.phone_bluetooth_speaker,
                                      color: headingClr,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '(704) 555-0127',
                                      style: appstyle(
                                          headingClr, FontWeight.w500, 14, ''),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(246, 247, 249, 1)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Gallery",
                                      style: appstyle(Colors.black,
                                          FontWeight.w500, 18, ''),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        "View all",
                                        style: appstyle(
                                            titleClr, FontWeight.w500, 14, ''),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 100,
                                child: ListView.builder(
                                    itemCount: 4,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Image.asset(
                                          'assets/images/1.png',
                                          height: 99,
                                          width: 99,
                                        ),
                                      );
                                    }),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Review",
                                style: appstyle(
                                    Colors.black, FontWeight.w500, 18, ''),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "View all",
                                  style: appstyle(
                                      titleClr, FontWeight.w500, 14, ''),
                                ),
                              )
                            ],
                          ),
                        ),
                        for (Review review in widget.serviceItem.review)
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
                                        review.name,
                                        style: appstyle(headingClr,
                                            FontWeight.w600, 20, ''),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "02 Dec",
                                        style: appstyle(headingClr,
                                            FontWeight.w600, 12, ''),
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
                                        style: appstyle(headingClr,
                                            FontWeight.w500, 16, ''),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                review.description,
                                style: appstyle(
                                    headingClr, FontWeight.w500, 14, ''),
                              ),
                              trailing: Text(
                                'Edit',
                                style: appstyle(
                                    primaryClr, FontWeight.w500, 12, ''),
                              )),
                        const SizedBox(
                          height: 150,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: buildFloatingButton(context, widget.serviceItem),
    );
  }

  Widget buildFloatingButton(BuildContext context, Services serviceItem) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            buildBottomsheet(context, serviceItem);
          },
          backgroundColor: primaryClr,
          child: const Icon(
            Icons.star_border,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: LoinRegisterButton(
            tap: () {
              Navigator.push(context, MaterialPageRoute(builder: (__) {
                return BookServicePage(
                  serviceItem: serviceItem,
                );
              }));
            },
            title: 'Continue',
          ),
        ),
      ],
    );
  }

  void buildBottomsheet(BuildContext context, Services serviceItem) {
    showDialog(
        context: context,
        builder: (__) {
          return Center(
            child: SizedBox(
              height: 500,
              width: MediaQuery.of(context).size.width * 0.8,
              child: AlertDialog(
                  content: SingleChildScrollView(
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/Check.png",
                        height: 60,
                        width: 60,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.4, color: primaryClr),
                          borderRadius: BorderRadius.circular(23),
                        ),
                        child: TextFormField(
                          controller: reviewController,
                          maxLines: 2,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: const Icon(
                                Icons.star_border,
                                color: titleClr,
                              ),
                              hintText: 'Enter your Review',
                              hintStyle:
                                  appstyle(titleClr, FontWeight.w400, 12, '')),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.4, color: primaryClr),
                          borderRadius: BorderRadius.circular(23),
                        ),
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: const Icon(
                                Icons.person,
                                color: titleClr,
                              ),
                              hintText: 'Enter your Name',
                              hintStyle:
                                  appstyle(titleClr, FontWeight.w400, 12, '')),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      LoinRegisterButton(
                        tap: () {
                          final reviews = Review(
                              description: reviewController.text,
                              name: nameController.text);
                          if (nameController.text.isNotEmpty &&
                              reviewController.text.isNotEmpty) {
                            widget.serviceItem.review =
                                List.from(widget.serviceItem.review)
                                  ..add(reviews);

                            Navigator.pop(context);
                            setState(() {});
                            reviewController.clear();
                            nameController.clear();
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  'Please fill in all required information.'),
                            ));
                          }

                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (__) {
                          //   return null;
                          // }));
                        },
                        title: 'Review',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ]),
              )),
            ),
          );
        });
  }
}
