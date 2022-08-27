import 'package:ecommerce_project/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(50)),
          width: 300,
          height: 34,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
            SizedBox(
              width: 24,
            ),
            Icon(
              Icons.search_outlined,
              color: orange,
              size: 16,
            ),
            Text(
              'Search',
              style: TextStyle(
                  color: Color.fromRGBO(1, 0, 53, 0.5),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            )
          ]),
        ),
        const SizedBox(
          width: 11,
        ),
        Container(
          decoration: BoxDecoration(
              color: orange, borderRadius: BorderRadius.circular(50)),
          width: 34,
          height: 34,
          child: const Icon(
            Icons.qr_code,
            color: white,
            size: 15,
          ),
        )
      ],
    );
  }
}
