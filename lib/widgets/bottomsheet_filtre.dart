import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trade_zilla/utilities/colors.dart';

class BottomSheetFiltre extends StatefulWidget {
  @override
  State<BottomSheetFiltre> createState() => _BottomSheetFilterState();
}

class _BottomSheetFilterState extends State<BottomSheetFiltre> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final List<String> dropdown_category = [
    "Laptop",
    "Mobile Phone",
    "Food",
    "Vehicle",
    "Bags",
    "Business"
  ];

  final List<String> dropdown_location = [
    "Lahore",
    "Islamabad",
    "Karachi",
    "Rawalpindi",
    "Multan",
    "Quetta"
  ];

  String selectedCategory = "Laptop";
  String selectedLocation = "Lahore";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Category",
                  style: GoogleFonts.roboto(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 8,
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  value: selectedCategory,
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value!;
                    });
                  },
                  items:
                      dropdown_category.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Location",
                  style: GoogleFonts.roboto(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 8,
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  value: selectedLocation,
                  onChanged: (title) {
                    setState(() {
                      selectedLocation = title!;
                    });
                  },
                  items:
                      dropdown_location.map<DropdownMenuItem<String>>((title) {
                    return DropdownMenuItem(
                      child: Text(title),
                      value: title,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(.9),
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      'Apply',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ))),
          )
        ],
      ),
    );
  }
}
