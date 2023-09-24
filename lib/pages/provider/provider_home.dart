import 'package:flutter/material.dart';

import '../../style/style.dart';

class ProviderHome extends StatelessWidget {
  const ProviderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryClr,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.message_outlined,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person_outline,
                color: Colors.white,
              )),
        ],
        title: Text(
          'Home',
          style: appstyle(Colors.white, FontWeight.w500, 18, ''),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              color: tilegClr,
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "Commission Type:",
                              style: appstyle(titleClr, FontWeight.w500, 14,
                                  'assets/fonts/WorkSans-Regular.ttf'),
                              children: const [
                            TextSpan(
                                text: '  Company',
                                style: TextStyle(
                                  color: headingClr,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ))
                          ])),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "My Commission:",
                              style: appstyle(titleClr, FontWeight.w500, 14,
                                  'assets/fonts/WorkSans-Regular.ttf'),
                              children: const [
                            TextSpan(
                                text: ' \$20',
                                style: TextStyle(
                                  color: headingClr,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                )),
                            TextSpan(
                                text: ' (Fixed)',
                                style: TextStyle(
                                  color: titleClr,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ))
                          ])),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: primaryClr,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.settings, color: Colors.white)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildProviderInfo(
                    '90', ' Total Booking', Icons.my_library_books_outlined),
                buildProviderInfo(
                    '15', ' Total Service', Icons.design_services_sharp),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildProviderInfo('30', ' HouseMan', Icons.person_2_outlined),
                buildProviderInfo(
                    '\$15', ' Total Earning', Icons.design_services_sharp),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              color: tilegClr,
              padding: const EdgeInsets.all(17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'General',
                    style: appstyle(headingClr, FontWeight.w700, 16, ''),
                  ),
                  Text(
                    'View All',
                    style: appstyle(primaryClr, FontWeight.w700, 16, ''),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 216,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color.fromRGBO(246, 247, 249, 1),
                            width: 2,
                          )),
                      child: Column(children: [
                        Container(
                          height: 110,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  topLeft: Radius.circular(12))),
                          child: Image.asset('assets/images/houseman.png',
                              height: 110, fit: BoxFit.fitHeight),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Asake Ayoke',
                          style: appstyle(headingClr, FontWeight.w700, 18, ''),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                backgroundColor: tilegClr,
                                child: Icon(
                                  Icons.call_outlined,
                                  color: primaryClr,
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: tilegClr,
                                child: Icon(
                                  Icons.message,
                                  color: primaryClr,
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: tilegClr,
                                child: Icon(
                                  Icons.message,
                                  color: primaryClr,
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Container buildProviderInfo(String amount, String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color.fromRGBO(235, 235, 235, 1),
          width: 1,
        ),
      ),
      width: 220,
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        title: Text(
          amount,
          style: appstyle(primaryClr, FontWeight.bold, 22, ''),
        ),
        subtitle: Text(
          title,
          style: appstyle(titleClr, FontWeight.w500, 14, ''),
        ),
        trailing: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CircleAvatar(
            backgroundColor: tilegClr,
            child: Icon(
              icon,
              color: primaryClr,
            ),
          ),
        ),
      ),
    );
  }
}
