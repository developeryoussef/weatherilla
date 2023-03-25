// ignore_for_file: unused_import, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  double? lat;
  double? long;
  Future<void> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
    lat = position.latitude;
    long = position.longitude;
    print('long$lat'  'alt$long');
  }
}