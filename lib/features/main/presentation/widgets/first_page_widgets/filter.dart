import 'package:ecommerce_project/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

Future<dynamic> showModalBottomSheetMetod(
  BuildContext context,
) {
  return showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      context: context,
      builder: (context) => SingleChildScrollView(
          padding: const EdgeInsets.only(
            bottom: 44,
            top: 24,
            left: 46,
            right: 31,
          ),
          child: Container(
            height: 375,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    button(() => Navigator.pop(context), true),
                    // SizedBox(
                    //   width: 63,
                    // ),
                    const Text(
                      'Filter options',
                      style: TextStyle(
                          color: textColorblue,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    // SizedBox(
                    //   width: 30,
                    // ),
                    button(() => Navigator.pop(context), false),
                  ],
                ),
              ),
              nameOfDropDown('Brand'),
              dropDown(selectedItem, items),
              nameOfDropDown('Price'),
              dropDown(selectedPrice, prices),
              nameOfDropDown('Size'),
              dropDown(selectedSize, size),
            ]),
          )));
}

SizedBox button(void Function()? onPressed, bool closeOrDone) {
  return SizedBox(
    width: closeOrDone ? 37 : 86,
    height: 37,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        primary: closeOrDone ? textColorblue : orange,
        // fixedSize: Size(20, 30),
        // maximumSize: Size(37, 37)
      ),
      onPressed: onPressed,
      child: Text(
        closeOrDone ? 'x' : 'Done',
        style: const TextStyle(color: white),
      ),
    ),
  );
}

Column nameOfDropDown(String name) {
  return Column(
    children: [
      const SizedBox(
        height: 20,
      ),
      Text(
        name,
        style: const TextStyle(
            color: textColorblue, fontSize: 18, fontWeight: FontWeight.w500),
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}

Container dropDown(String? selectedItem, List<String> items) {
  return Container(
    // margin: EdgeInsets.all(8),

    width: 337,
    height: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xffDCDCDC))),
    child: DropdownButtonFormField<String>(
      iconEnabledColor: const Color(0xffDCDCDC),
      alignment: AlignmentDirectional.center,
      isExpanded: false,
      decoration: const InputDecoration(
          enabled: false,
          enabledBorder: InputBorder.none,
          border: InputBorder.none),
      // decoration: InputDecoration(
      //     border: OutlineInputBorder(
      //         borderRadius: BorderRadius.circular(10),
      //         borderSide: BorderSide(width: 3, color: Colors.grey),),),
      value: selectedItem,
      items: items
          .map((e) => DropdownMenuItem<String>(
              value: e,
              child: Text(
                e,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              )))
          .toList(),
      onChanged: (String? name) {
        selectedItem = name;
      },
    ),
  );
}
