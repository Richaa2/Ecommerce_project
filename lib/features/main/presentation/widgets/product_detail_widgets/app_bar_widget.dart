import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../../consts.dart';

class ProductDetailAppBar extends StatelessWidget {
  final String name;
  final IconData icon;
  const ProductDetailAppBar({Key? key, required this.name, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          button(() => Navigator.pop(context), true),
          SizedBox(width: name == 'Add adress' ? 100 : null),
          Text(
            name,
            style: const TextStyle(
                color: textColorblue,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          button(() => Navigator.pop(context), false)
        ],
      ),
    );
  }

//TODO change to container
  SizedBox button(void Function()? onPressed, bool closeOrDone) {
    return SizedBox(
      width: 48,
      height: 37,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            primary: closeOrDone ? textColorblue : orange,
            // fixedSize: Size(10, 10),
            // maximumSize: Size(37, 37),
          ),
          onPressed: onPressed,
          child: Center(
            child: Icon(
              closeOrDone ? Icons.arrow_back : icon,
              color: white,
              size: 17,
            ),
          )),
    );
  }
}
