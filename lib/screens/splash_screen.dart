import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_health_monitoring_app/screens/choose.dart';
import 'package:patient_health_monitoring_app/screens/DoctorScreens/doctorlogin.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';
import 'package:patient_health_monitoring_app/utils/images.dart';


class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => Choose()
            )
         )
         
    );
   
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: bgcolor,
    body: SafeArea(
      child: Center(
        child: Image.asset(logo)
      ),
    ),
   );
  }
}