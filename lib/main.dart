// ignore_for_file: unused_import, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_constructors, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherilla/controller/location_controller.dart';
import 'package:weatherilla/screens/homepage.dart';
import 'package:weatherilla/screens/thepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
SharedPreferences? sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp());
                    

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  build(BuildContext context) {
             LocationController controller = Get.put(LocationController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: sharedPreferences!.getString('can') == 'yes' ? TheMainPage() : HomePage(),
    );
  }
}

