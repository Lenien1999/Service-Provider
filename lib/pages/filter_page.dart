import 'package:flutter/material.dart';
import 'package:serviceprovder/style/style.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  int _selectedOption = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ))
        ],
        toolbarHeight: 50,
        backgroundColor: primaryClr,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        title: Text(
          'Filter',
          style: appstyle(Colors.white, FontWeight.w500, 18, ''),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Text(
                        'Status',
                        style: appstyle(const Color.fromRGBO(28, 31, 52, 1),
                            FontWeight.w500, 14, ''),
                      ),
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Text(
                        'Provider',
                        style: appstyle(primaryClr, FontWeight.w500, 14, ''),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              color: const Color.fromRGBO(246, 247, 249, 1),
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromRGBO(235, 235, 235, 1))),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            leading: CircleAvatar(
                              radius: 50,
                              child: Image.asset(
                                'assets/images/avater.png',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              'Aminu Azeez',
                              style: appstyle(
                                  const Color.fromRGBO(28, 31, 52, 1),
                                  FontWeight.w500,
                                  14,
                                  ''),
                            ),
                            subtitle: Text(
                              'Member since 2015',
                              style: appstyle(
                                  const Color.fromRGBO(108, 117, 125, 1),
                                  FontWeight.w500,
                                  12,
                                  ''),
                            ),
                            trailing: Radio(
                              activeColor: primaryClr,
                              fillColor: MaterialStateProperty.all(Colors.red),
                              splashRadius: 2,
                              value: 1,
                              groupValue: _selectedOption,
                              onChanged: ((value) {
                                setState(() {
                                  _selectedOption = value!;
                                });
                              }),
                            ),
                          ),
                        );
                      })
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
