// ignore_for_file: unused_import, prefer_const_constructors, unnecessary_new, sort_child_properties_last, no_leading_underscores_for_local_identifiers, unused_local_variable, avoid_print, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherilla/constant.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherilla/controller/location_controller.dart';
import 'package:weatherilla/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    LocationController controller = Get.put(LocationController());
     LocationPermission? _permission;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: mainColor,
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 10,
        backgroundColor: mainColor,
        title: Text('Home'),
        centerTitle: true,
        actions: const [
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 75),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 7,
              child: MaterialButton(
                minWidth: Get.width - 60,
                height: 65,
                child: Center(
                  child: Container(
                    width: Get.width - 60,
                    height: 65,
                    child: Center(
                      child: Text('Allow Weatherilla to acces the location' , style: normalTextStyle),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 14,
                          color: Colors.black.withOpacity(0.35)
                        ),
                      ],
                      color: mainColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                onPressed: () async {
                  _permission = await Geolocator.checkPermission();
                  if (_permission == LocationPermission.denied) {
                    await Geolocator.requestPermission();
                    await controller.getLocation();
                    sharedPreferences!.setString('can', 'yes');
                  }
                  else if(_permission == LocationPermission.whileInUse) {
                    await controller.getLocation();
                  }
                  else if(_permission == LocationPermission.always){
                    await controller.getLocation();
                  }
                  else if(_permission == LocationPermission.deniedForever){
                    await controller.getLocation();
                    await Geolocator.requestPermission();
                  }
                  else if(_permission == LocationPermission.unableToDetermine){
                    await Geolocator.requestPermission();
                    await controller.getLocation();
                    sharedPreferences!.setString('can', 'yes');
                  }
                  else {
                    sharedPreferences!.setString('can', 'yes');
                  }
              },
              ),
              ),
              Expanded(flex: 11,child: locationImage),
          ],
        ),
      ),
    );
  }
}
