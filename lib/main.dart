import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:weatherio/utilities/constants.dart';
import 'package:weatherio/utilities/location.dart';
import 'package:weatherio/utilities/networkingHelper.dart';
import 'package:weatherio/WetherDataModel/weatherDataModel.dart';
import 'screens/landing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(kScaffoldBgColor),
      ),
      home: LandingScreen(),
    );
  }
}
