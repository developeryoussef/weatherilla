// ignore_for_file: unused_import, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherilla/screens/homepage.dart';
import 'package:weatherilla/screens/thepage.dart';

bool? isAcces;
LocationPermission? _permission;
void main() async {
  runApp(MyApp());
                    _permission = await Geolocator.checkPermission();
                    if (_permission == LocationPermission.denied) {
                      isAcces = false;
                    }
                    else {
                      isAcces = true;
                    }

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
         

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: isAcces == false ? HomePage() : TheMainPage(),
    );
  }
}
