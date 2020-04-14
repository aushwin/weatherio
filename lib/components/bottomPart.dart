import 'package:flutter/material.dart';
import 'package:weatherio/utilities/constants.dart';
import 'package:weather_icons/weather_icons.dart';

class BottomPart extends StatelessWidget {
  BottomPart(
      {@required this.icon, @required this.tempText, @required this.dateText});
  final IconData icon;
  final String dateText;
  final String tempText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(dateText),
          Icon(
            icon,
            color: Color(kCommonTextColor),
          ),
          Text("$tempText°")
        ],
      ),
    );
  }
}
