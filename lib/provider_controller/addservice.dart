import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:serviceprovder/pages/bottomNavigation.dart';
import 'package:serviceprovder/style/style.dart';
import 'package:serviceprovder/widget/build_textfield.dart';

class AddServices extends StatefulWidget {
  const AddServices({super.key});

  @override
  State<AddServices> createState() => _AddServicesState();
}

class _AddServicesState extends State<AddServices> {
  String _selectedItem = 'Hair Dressing';
  List<String> dropdownitems =
      ['Hair Dressing', 'Smart Home', 'Car Washing', 'Painting'].toList();
  List<int> dropdownDsicount = [
    20,
    30,
    50,
    70,
  ].toList();
  int _selectedDis = 20;
  XFile? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = XFile(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
  }

  final location = TextEditingController();
  final description = TextEditingController();
  final price = TextEditingController();
  final name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: primaryClr,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (__) {
                return BuildBottomNavigation();
              }));
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        centerTitle: true,
        title: Text(
          'Add Service',
          style: appstyle(Colors.white, FontWeight.w500, 18, ''),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _image != null
                    ? Image.file(
                        File(_image!.path),
                        height: 120,
                        fit: BoxFit.cover,
                      )
                    : InkWell(
                        onTap: _getImage,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          strokeWidth: 1,
                          color: Colors.grey,
                          dashPattern: const [6, 3, 2, 3],
                          radius: const Radius.circular(12),
                          padding: const EdgeInsets.all(15),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: SizedBox(
                              height: 120,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/Image.png'),
                                  const Text(
                                    'Choose Image',
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 15,
                ),
                BuildTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter service Name';
                    } else {
                      return null;
                    }
                  },
                  hint: 'Service Name',
                  icon: Icons.production_quantity_limits_rounded,
                  controller: name,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Expanded(
                    child: BuildTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the price';
                        } else {
                          return null;
                        }
                      },
                      hint: 'Price ',
                      icon: Icons.price_change_rounded,
                      controller: price,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      child: DropdownButtonFormField<int>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(246, 247, 249, 1),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                    ),
                    value: _selectedDis,
                    items: dropdownDsicount
                        .map(
                          (value) => DropdownMenuItem<int>(
                            value: value,
                            child: Text('$value%'),
                          ),
                        )
                        .toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedDis = newValue!;
                      });
                    },
                  ))
                ]),
                const SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(246, 247, 249, 1),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                  ),
                  value: _selectedItem,
                  items: dropdownitems
                      .map(
                        (value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedItem = newValue!;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                BuildTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the location';
                    } else {
                      return null;
                    }
                  },
                  hint: 'Location ',
                  icon: Icons.edit_location_sharp,
                  controller: location,
                ),
                const SizedBox(
                  height: 15,
                ),
                BuildTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the description';
                    } else {
                      return null;
                    }
                  },
                  maxline: 5,
                  hint: 'Description ',
                  controller: description,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  // alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryClr,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {},
                    child: const Text(
                      'Add Service',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          )),
    );
  }
}
