import 'package:weatherio/utilities/networkingHelper.dart';
import 'dart:convert';
import 'package:weather_icons/weather_icons.dart';
import 'package:flutter/material.dart';

class WeatherDataModel {
  WeatherDataModel({this.networkingHelper});
  final NetworkingHelper networkingHelper;
  int Mtemp;
  var Wind;
  String Desc;
  IconData IconC;
  List day1List = List();
  List day2List = List();
  List day3List = List();
  List day4List = List();
  var now = DateTime.now();
  Map weekDays = {
    0: "Sun",
    1: "Mon",
    2: "Tue",
    3: "Wed",
    4: "Thur",
    5: "Fri",
    6: "Sat"
  };
  Map month = {
    1: "Jan",
    2: "Feb",
    3: "Mar",
    4: "Arpl",
    5: "May",
    6: "Jun",
    7: "Jul",
    8: "Aug",
    9: "Sep",
    10: "Oct",
    11: "Nov",
    12: "Dec"
  };
  // to get current TIME
  Future get() async {
    var response = await networkingHelper.getData();
    var decodedData = jsonDecode(response.body);
    //to get temperature
    double temp1d = (decodedData['daily'][0]['feels_like']['day']) - 273.15;
    double temp2d = (decodedData['daily'][1]['feels_like']['day']) - 273.15;
    double temp3d = (decodedData['daily'][2]['feels_like']['day']) - 273.15;
    double temp4d = (decodedData['daily'][3]['feels_like']['day']) - 273.15;
    int temp1 = temp1d.round();
    int temp2 = temp2d.round();
    int temp3 = temp3d.round();
    int temp4 = temp4d.round();
    //to id
    var id1 = decodedData['daily'][0]['weather'][0]['id'];
    var id2 = decodedData['daily'][1]['weather'][0]['id'];
    var id3 = decodedData['daily'][2]['weather'][0]['id'];
    var id4 = decodedData['daily'][3]['weather'][0]['id'];
    //combining time and todays time
    String day1 = "${weekDays[now.weekday + 1]},${month[now.month]} ${now.day}";
    String day2 =
        "${weekDays[now.weekday + 2]},${month[now.month]} ${now.day + 1}";
    String day3 =
        "${weekDays[now.weekday + 3]},${month[now.month]} ${now.day + 2}";
    String day4 =
        "${weekDays[now.weekday + 4]},${month[now.month]} ${now.day + 3}";
    //adding components into the list
    day1List.add(day1);
    day1List.add(temp1);
    day1List.add(IcondId(id1));
    day2List.add(day2);
    day2List.add(temp2);
    day2List.add(IcondId(id2));
    day3List.add(day3);
    day3List.add(temp3);
    day3List.add(IcondId(id3));
    day4List.add(day4);
    day4List.add(temp4);
    day4List.add(IcondId(id4));
    //to get current data
    double MDtemp = (decodedData['current']['temp']) - 273.15;
    Mtemp = MDtemp.round();
    Desc = decodedData['current']['weather'][0]['description'];
    Wind = decodedData['current']['wind_speed'];
    IconC = IcondId(decodedData['current']['weather'][0]['id']);
  }

  IconData IcondId(int n) {
    if (n > 800)
      return WeatherIcons.day_cloudy;
    else if (n == 800)
      return WeatherIcons.cloud;
    else if (n > 781)
      return WeatherIcons.tornado;
    else if (n > 761)
      return WeatherIcons.dust;
    else if (n > 751)
      return WeatherIcons.sandstorm;
    else if (n > 741)
      return WeatherIcons.fog;
    else if (n > 731)
      return WeatherIcons.dust;
    else if (n > 701)
      return WeatherIcons.smoke;
    else if (n > 600)
      return WeatherIcons.snow;
    else if (n > 500)
      return WeatherIcons.rain;
    else if (n > 300)
      return WeatherIcons.day_sprinkle;
    else
      return WeatherIcons.thunderstorm;
  }
}
