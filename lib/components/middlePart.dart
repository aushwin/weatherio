import 'package:flutter/material.dart';
import 'package:weatherio/screens/landing.dart';
import 'package:weatherio/utilities/constants.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weatherio/screens/weatherScreen.dart';

class MiddlePart extends StatelessWidget {
  const MiddlePart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        // middle part
        children: [
          SizedBox(
            height: 60,
          ),
          Center(
            //for the icon
            child: Icon(
              weatherDataModel.IconC,
              color: Color(kCommonTextColor),
              size: 60,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            //for the degree
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherDataModel.Mtemp.toString(),
                style: kDegreeText,
              ),
              Text(
                "°",
                style: kDegreeText,
              )
            ],
          ),
          Text(
            weatherDataModel.Desc,
            style: kTopPlaceNameText,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Wind",
            style: kTopPlaceNameHolderText,
          ),
          Row(
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Icon(
                WeatherIcons.strong_wind,
                color: Color(kCommonTextColor),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "${weatherDataModel.Wind}m/s",
                style: kTopPlaceNameHolderText,
              )
            ],
          ),
        ],
      ),
    );
  }
}
