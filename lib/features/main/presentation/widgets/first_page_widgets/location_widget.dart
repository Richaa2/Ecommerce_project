import 'package:ecommerce_project/consts.dart';
import 'package:flutter/material.dart';

import 'filter.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var heightScreen = screenSize.height;
    return Column(
      children: [
        SizedBox(
          height: heightScreen / 39,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            const Icon(
              Icons.place_outlined,
              color: orange,
            ),
            const Text(
              'Zihuatanejo, Gro',
              style: TextStyle(
                  color: textColorblue,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            const Icon(Icons.arrow_drop_down_outlined),
            const Spacer(
              flex: 1,
            ),
            IconButton(
                icon: const Icon(
                  Icons.filter_alt_outlined,
                  color: textColorblue,
                ),
                onPressed: () {
                  showModalBottomSheetMetod(context);
                })
          ],
        ),
      ],
    );
  }
}
