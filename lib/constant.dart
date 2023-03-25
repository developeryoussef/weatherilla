// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Color mainColor = Color.fromARGB(255, 16, 166, 151);
Container locationImage = Container(
  decoration: BoxDecoration(
    image: DecorationImage(image: AssetImage('assets/Globalization-pana.png')),
    boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0)
                        ),
                      ],
  ),
);
TextStyle normalTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 17,
);