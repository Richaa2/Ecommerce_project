import 'package:ecommerce_project/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ViewAll extends StatelessWidget {
  final String name;
  final String secondTitle;
  const ViewAll({Key? key, required this.name, this.secondTitle = 'see more'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(
            color: textColorblue,
            fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
        ),
        Text(
          secondTitle,
          style: TextStyle(
              color: orange, fontWeight: FontWeight.w400, fontSize: 15),
        ),
      ],
    );
  }
}
