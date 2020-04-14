import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weatherio/utilities/constants.dart';
import 'package:weatherio/utilities/location.dart';
import 'package:weatherio/utilities/networkingHelper.dart';
import 'package:weatherio/WetherDataModel/weatherDataModel.dart';
import 'package:weatherio/screens/weatherScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

WeatherDataModel weatherDataModel;
Location location = Location();

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    await location.getCurrentLocation();
    NetworkingHelper networkingHelper = NetworkingHelper(
        url:
            'https://api.openweathermap.org/data/2.5/onecall?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey');
    weatherDataModel = WeatherDataModel(networkingHelper: networkingHelper);
    await weatherDataModel.get();
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return WeatherScreen(
        weatherDataModel: weatherDataModel,
        lat: location.latitude,
        long: location.longitude,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
