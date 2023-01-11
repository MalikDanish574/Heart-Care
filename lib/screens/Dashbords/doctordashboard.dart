import 'package:flutter/material.dart';
import 'package:patient_health_monitoring_app/utils/images.dart';
import 'package:patient_health_monitoring_app/widgets/Appbar.dart';

import '../../utils/colors.dart';

class DoctorDashboard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image.asset(logoRed)),
            Center(
              child: Text(
                    "IoT-Based Blood Pressure\nMonitoring System",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: textred,
                        fontSize: 25,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500),
                  ),
            ),
          ],
        ),
      )),
    );
  }

}