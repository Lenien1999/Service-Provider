import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serviceprovder/controller/controller.dart';
import 'package:serviceprovder/model/servicemodel.dart';
import 'package:serviceprovder/pages/service_detail.dart';
import 'package:serviceprovder/style/style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../model/category_model.dart';
import 'category_home.dart';
import 'provider/servicegrid.dart';
import 'service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List imageSlider = [
    'assets/images/home.png',
    'assets/images/home1.png',
    'assets/images/home2.png',
  ];
  String selectedCategory = 'painting';
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0x00f6f7f9),
      body: SafeArea(
        child:
            Consumer<PageNotifier>(builder: (context, homecontroller, child) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: false,
                snap: false,
                floating: true,
                automaticallyImplyLeading: false,
                actions: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.notifications_none_outlined,
                        color: titleClr,
                      ),
                    ),
                  ),
                ],
                expandedHeight: size.height,
                flexibleSpace: FlexibleSpaceBar(
                  background: ListView(
                    children: [
                      SizedBox(
                        height: size.height * 0.4,
                        width: size.width,
                        child: PageView.builder(
                            onPageChanged: (page) {
                              setState(() {
                                homecontroller.currentPage = page;
                              });
                            },
                            controller: _controller,
                            itemCount: imageSlider.length,
                            itemBuilder: ((context, index) {
                              return Stack(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                          primaryClr,
                                          Colors.black
                                        ])),
                                    height: size.height * 0.35,
                                    width: size.width,
                                    child: Image.asset(
                                      imageSlider[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                      right: 0,
                                      left: 0,
                                      bottom: 60,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(
                                            imageSlider.length,
                                            (index) => Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: homecontroller
                                                              .currentPage ==
                                                          index
                                                      ? const CircleAvatar(
                                                          radius: 8,
                                                          backgroundColor:
                                                              Colors.white,
                                                        )
                                                      : const CircleAvatar(
                                                          radius: 5,
                                                          backgroundColor:
                                                              Colors.white,
                                                        ),
                                                )),
                                      )),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.white,
                                                  spreadRadius: 1,
                                                  blurRadius: 2,
                                                )
                                              ],
                                              color: Colors.white,
                                              border: Border.all(
                                                  width: 2,
                                                  color: const Color.fromARGB(
                                                      255, 235, 224, 224)),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.location_on,
                                                    color: titleClr,
                                                  )),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                'No 12, Ajegunle Compound',
                                                overflow: TextOverflow.ellipsis,
                                                style: appstyle(
                                                    titleClr,
                                                    FontWeight.w500,
                                                    14,
                                                    'assets/fonts/WorkSans-Regular.ttf'),
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons
                                                        .private_connectivity_outlined,
                                                    color: titleClr,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(15.0),
                                            child: Icon(
                                              Icons.search,
                                              color: titleClr,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              );
                            })),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Category",
                              style: appstyle(
                                  Colors.black, FontWeight.w500, 18, ''),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return const CategoryPage();
                                }));
                              },
                              child: Text(
                                "View all",
                                style:
                                    appstyle(titleClr, FontWeight.w500, 14, ''),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: SizedBox(
                          height: size.height * 0.35,
                          child: GridView.builder(
                              itemCount: categoryList.length.clamp(1, 6),
                              gridDelegate:
                                  (const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 15,
                                      crossAxisSpacing: 15,
                                      crossAxisCount: 3)),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (__) {
                                      return ServicePage(
                                        services: categoryList[index],
                                       
                                      );
                                    }));
                                  },
                                  child: Container(
                                    height: 70,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 238, 232, 232),
                                            blurRadius: 1,
                                            spreadRadius: 1)
                                      ],
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Container(
                                          padding: const EdgeInsets.all(20),
                                          color: const Color.fromRGBO(
                                              235, 235, 235, 1),
                                          child: Image.asset(
                                            categoryList[index].image,
                                            width: size.width,
                                            fit: BoxFit.contain,
                                          ),
                                        )),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            categoryList[index].name,
                                            style: appstyle(titleClr,
                                                FontWeight.w500, 14, ''),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        height: 396,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Services",
                                  style: appstyle(
                                      Colors.black, FontWeight.w500, 18, ''),
                                ),
                                GestureDetector(
                                  onTap: () {
                                      Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return   const ServiceGrid();
                            }));
                                  },
                                  child: Text(
                                    "View all",
                                    style: appstyle(
                                        titleClr, FontWeight.w500, 14, ''),
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 311,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: serviceList.length.clamp(1, 4),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      final serviceItem = serviceList[index];
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return ServiceDetails(

                                                serviceItem: serviceItem);
                                          }));
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(20),
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
                                                  color: const Color.fromARGB(
                                                      255, 224, 222, 222)),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.white),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 155,
                                                child: Stack(
                                                  children: [
                                                    Image.asset(
                                                      serviceItem.images,
                                                      fit: BoxFit.cover,
                                                      height: 140,
                                                    ),
                                                    Positioned(
                                                        left: 10,
                                                        top: 10,
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color:
                                                                    primaryClr,
                                                                width: 1),
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        23),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5.0),
                                                            child: Text(
                                                              serviceItem.name,
                                                              style: const TextStyle(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color:
                                                                      primaryClr),
                                                            ),
                                                          ),
                                                        )),
                                                    Positioned(
                                                        right: 20,
                                                        bottom: 0,
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .white,
                                                                width: 1),
                                                            color: primaryClr,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        23),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        5.0,
                                                                    horizontal:
                                                                        10),
                                                            child: Text(
                                                              "\$ ${serviceItem.price}",
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white),
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
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              horizontal: 1),
                                                      itemSize: 20,
                                                      direction:
                                                          Axis.horizontal,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return const Icon(
                                                          Icons.star,
                                                          color: Color.fromRGBO(
                                                              255, 189, 0, 1),
                                                        );
                                                      },
                                                      onRatingUpdate:
                                                          (rating) {}),
                                                  Text(
                                                    "4.3",
                                                    style: appstyle(
                                                        Colors.grey,
                                                        FontWeight.bold,
                                                        14,
                                                        ''),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  width: 180,
                                                  child: Text(
                                                    serviceItem.description,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: appstyle(
                                                        const Color.fromRGBO(
                                                            28, 31, 52, 1),
                                                        FontWeight.w500,
                                                        16,
                                                        ''),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                          const Color.fromRGBO(
                                                              108, 117, 125, 1),
                                                          FontWeight.w600,
                                                          14,
                                                          ''),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
