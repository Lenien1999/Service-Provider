import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:serviceprovder/style/style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../widget/login_register_btn.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({super.key});

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
                            'assets/images/home2.png',
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
                                      "TV Wall Mount Installation",
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
                                              text: ' \$120',
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
                          children: [
                            Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  color:
                                      const Color.fromARGB(255, 221, 224, 228)),
                              child: Center(
                                child: Text(
                                  'New York',
                                  style: appstyle(
                                      const Color.fromARGB(255, 139, 137, 137),
                                      FontWeight.w600,
                                      16,
                                      ''),
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  color: primaryClr),
                              child: Center(
                                child: Text(
                                  'California',
                                  style: appstyle(
                                      Colors.white, FontWeight.w600, 16, ''),
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  color:
                                      const Color.fromARGB(255, 221, 224, 228)),
                              child: Center(
                                child: Text(
                                  'New Mexico',
                                  style: appstyle(
                                      const Color.fromARGB(255, 139, 137, 137),
                                      FontWeight.w600,
                                      16,
                                      ''),
                                ),
                              ),
                            ),
                          ],
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
                                      style: appstyle(
                                          headingClr, FontWeight.w600, 20, ''),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "02 Dec",
                                      style: appstyle(
                                          headingClr, FontWeight.w600, 12, ''),
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
                                      style: appstyle(
                                          headingClr, FontWeight.w500, 16, ''),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            subtitle: Text(
                              "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet",
                              style:
                                  appstyle(headingClr, FontWeight.w500, 14, ''),
                            ),
                            trailing: Text(
                              'Edit',
                              style:
                                  appstyle(primaryClr, FontWeight.w500, 12, ''),
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
      floatingActionButton: buildFloatingButton(),
    );
  }

  Widget buildFloatingButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            // Add your action here
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
              // Add your action here
            },
            title: 'Continue',
          ),
        ),
      ],
    );
  }
}
