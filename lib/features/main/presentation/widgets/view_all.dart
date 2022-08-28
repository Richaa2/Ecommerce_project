import 'package:ecommerce_project/consts.dart';
import 'package:flutter/cupertino.dart';

class ViewAll extends StatelessWidget {
  final String name;
  final String secondTitle;
  const ViewAll({Key? key, required this.name, this.secondTitle = 'see more'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var heightScreen = screenSize.height;
    return Column(
      children: [
        SizedBox(
            height: name == 'Select Category'
                ? heightScreen / 45
                : name == 'Hot Sales'
                    ? heightScreen / 34
                    : heightScreen / 52),
        Row(
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
        ),
        SizedBox(
            height: name == 'Select Category'
                ? heightScreen / 34
                : name == 'Hot Sales'
                    ? heightScreen / 52
                    : heightScreen / 52),
      ],
    );
  }
}
