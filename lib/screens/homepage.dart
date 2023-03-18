// ignore_for_file: unused_import, prefer_const_constructors, unnecessary_new, sort_child_properties_last, no_leading_underscores_for_local_identifiers, unused_local_variable, avoid_print, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherilla/constant.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  
  @override
  Widget build(BuildContext context) {
     LocationPermission? _permission;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: mainColor,
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        
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
                      color: mainColor,
                      borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                ),
                onPressed: () async {
                  _permission = await Geolocator.checkPermission();
                  if (_permission == LocationPermission.denied) {
                    await Geolocator.requestPermission();
                    
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
