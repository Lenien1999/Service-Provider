import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

import '../model/review.dart';
import '../model/servicemodel.dart';
import '../style/style.dart';

class ServiceReviewList extends StatefulWidget {
  final List<Review> review;
  final Services service;
  const ServiceReviewList(
      {super.key, required this.review, required this.service});

  @override
  State<ServiceReviewList> createState() => _ServiceReviewListState();
}

class _ServiceReviewListState extends State<ServiceReviewList> {
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
              widget.service.name,
              style: appstyle(Colors.white, FontWeight.w500, 14, ''),
            ),
          ),
        ],
        title: Text(
          'Review',
          style: appstyle(Colors.white, FontWeight.w500, 16, ''),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Review",
              style: appstyle(Colors.black, FontWeight.bold, 18, ''),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.service.review.length,
                  itemBuilder: (context, index) {
                    if (index < widget.service.review.length) {
                      final reviews = widget.review[index];
                      return Container(
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.all(15),
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: const Color.fromRGBO(246, 247, 249, 1)),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Image(
                                image: AssetImage(widget.service.images),
                                width: 130,
                                fit: BoxFit.cover,
                              ),
                              title: Text(
                                widget.service.name,
                                style: appstyle(
                                    Colors.black, FontWeight.w500, 18, ''),
                              ),
                              subtitle: Text(
                                "See Details",
                                style:
                                    appstyle(titleClr, FontWeight.bold, 14, ''),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Your Comment",
                                        style: appstyle(headingClr,
                                            FontWeight.bold, 18, ''),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.edit,
                                                color: titleClr,
                                              )),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  widget.review.remove(reviews);
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                                color: titleClr,
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: titleClr,
                                    thickness: 0.4,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          RatingBar.builder(
                                              initialRating: 4,
                                              minRating: 1,
                                              itemCount: 5,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 1),
                                              itemSize: 20,
                                              direction: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return const Icon(
                                                  Icons.star,
                                                  color: Color.fromRGBO(
                                                      255, 189, 0, 1),
                                                );
                                              },
                                              onRatingUpdate: (rating) {}),
                                          Text(
                                            "4.3",
                                            style: appstyle(Colors.grey,
                                                FontWeight.bold, 14, ''),
                                          )
                                        ],
                                      ),
                                      Text(
                                        DateFormat.yMMM().format(reviews.time),
                                        style: appstyle(Colors.grey,
                                            FontWeight.w500, 17, ''),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    reviews.description,
                                    style: appstyle(
                                        titleClr, FontWeight.w500, 17, ''),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return Container(
                        height: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(
                                color: const Color.fromARGB(255, 236, 234, 234),
                                width: 0.3)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'No review yet',
                              style:
                                  appstyle(primaryClr, FontWeight.bold, 18, ''),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  3,
                                  (index) => const Icon(
                                        Icons.star_border,
                                        color: primaryClr,
                                        size: 60,
                                      )),
                            )
                          ],
                        ),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
