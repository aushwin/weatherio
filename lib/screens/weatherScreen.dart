import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weatherio/screens/landing.dart';
import 'package:weatherio/utilities/constants.dart';
import 'package:weatherio/components/middlePart.dart';
import 'package:weatherio/components/bottomPart.dart';
import 'package:weatherio/WetherDataModel/weatherDataModel.dart';
import 'package:geocoder/geocoder.dart';

var cityName;
String name = "";
String nameL = "";

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.weatherDataModel, this.lat, this.long});
  final WeatherDataModel weatherDataModel;
  final double lat, long;
  @override
  _WeatherScreenState createState() =>
      _WeatherScreenState(lattitude: lat, longitude: long);
}

class _WeatherScreenState extends State<WeatherScreen> {
  _WeatherScreenState({this.lattitude, this.longitude});
  final double lattitude;
  final double longitude;
  void getName() async {
    final coordinates = new Coordinates(lattitude, longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    setState(() {
      print(first.adminArea);
      name = first.subAdminArea;
      nameL = first.adminArea;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "$name , $nameL",
                    textAlign: TextAlign.center,
                    style: kTopPlaceNameText,
                  ),
                  Text(
                    "Now",
                    textAlign: TextAlign.center,
                    style: kTopPlaceNameHolderText,
                  ),
                ],
              ),
            ),
            MiddlePart(), // middle section
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  BottomPart(
                    icon: weatherDataModel.day1List[2],
                    dateText: weatherDataModel.day1List[0].toString() ??
                        "GettingDate",
                    tempText: weatherDataModel.day1List[1].toString() ??
                        "Getting Temp",
                  ),
                  BottomPart(
                    icon: weatherDataModel.day2List[2],
                    dateText: weatherDataModel.day2List[0].toString() ??
                        "GettingDate",
                    tempText: weatherDataModel.day2List[1].toString() ??
                        "Getting Temp",
                  ),
                  BottomPart(
                    icon: weatherDataModel.day3List[2],
                    dateText: weatherDataModel.day3List[0].toString() ??
                        "GettingDate",
                    tempText: weatherDataModel.day3List[1].toString() ??
                        "Getting Temp",
                  ),
                  BottomPart(
                    icon: weatherDataModel.day4List[2],
                    dateText: weatherDataModel.day4List[0].toString() ??
                        "GettingDate",
                    tempText: weatherDataModel.day4List[1].toString() ??
                        "Getting Temp",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
