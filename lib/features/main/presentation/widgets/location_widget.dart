import 'package:ecommerce_project/consts.dart';
import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Spacer(
          flex: 1,
        ),
        Icon(
          Icons.place_outlined,
          color: orange,
        ),
        Text(
          'Zihuatanejo, Gro',
          style: TextStyle(
              color: textColorblue, fontSize: 15, fontWeight: FontWeight.w500),
        ),
        Icon(Icons.arrow_drop_down_outlined),
        Spacer(
          flex: 1,
        ),
        Icon(
          Icons.filter_alt_outlined,
          color: textColorblue,
        )
      ],
    );
  }
}
