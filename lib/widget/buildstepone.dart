import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../controller/mainscreencontroller.dart';
import '../model/servicemodel.dart';
import '../style/style.dart';

class BuildStepOne extends StatefulWidget {
  final Services serviceItem;
  final Function(DateTime) onDateSelected;
  final Function(String) onAddressSelected;
  const BuildStepOne({
    super.key,
    required this.serviceItem,
     required this.onDateSelected,
    required this.onAddressSelected,
  });

  @override
  State<BuildStepOne> createState() => _BuildStepOneState();
}

class _BuildStepOneState extends State<BuildStepOne> {
  DateTime initialDate = DateTime.now();
  DateTime? selectedDateTime;
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

  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenController>(
      builder: (BuildContext context, value, Widget? child) {
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
                        readOnly: true,
                        controller: TextEditingController(
                          // Use a TextEditingController to display selectedDateTime
                          text: selectedDateTime != null
                              ? DateFormat('MMMM-dd-yyyy, HH:mm')
                                  .format(selectedDateTime!)
                              : 'Select Date and Time', // Placeholder text
                        ),
                        onTap: () async {
                          final pickedDateTime = await showDateTimePicker(
                            context: context,
                          );
                          if (pickedDateTime != null) {
                            setState(() {
                              selectedDateTime = pickedDateTime;
                              widget.onDateSelected(pickedDateTime);
                            });
                          }
                        },
                         onChanged: (value) {
                          // Pass the entered address to the parent widget
                          widget.onAddressSelected(value);
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          
                          contentPadding: const EdgeInsets.all(12),
                          prefixIcon: GestureDetector(
                            onTap: () async {
                              final pickedDateTime = await showDateTimePicker(
                                context: context,
                              );
                              if (pickedDateTime != null) {
                                setState(() {
                                  selectedDateTime = pickedDateTime;
                                   widget.onDateSelected(pickedDateTime);
                                });
                              }
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
                        controller: addressController,
                          onChanged: (value) {
                          // Pass the entered address to the parent widget
                          widget.onAddressSelected(value);
                        },
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
                            style:
                                appstyle(primaryClr, FontWeight.w500, 14, '')),
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
            GestureDetector(
              onTap: () {
                if (selectedDateTime != null &&
                    addressController.text.isNotEmpty) {
                  value.bookingPage = 1;
                } else {
                  // Show an error message if information is not filled
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Please fill in all required information.'),
                  ));
                }
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    color: primaryClr, borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Text(
                  ' Next',
                  style: appstyle(Colors.white, FontWeight.bold, 16, ''),
                )),
              ),
            ),
          ],
        );
      },
    );
  }
}

