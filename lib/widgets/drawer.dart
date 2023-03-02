import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:patient_health_monitoring_app/screens/ContactUs.dart';
import 'package:patient_health_monitoring_app/screens/PatientScreens/patientdashboard.dart';
import 'package:patient_health_monitoring_app/screens/choose.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';

import 'Clipper.dart';

class CustomDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return ClipPath(
     clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: textred, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[

                
                  SizedBox(height: 80.0),
                  Text(
                    "MAlik",
                    style: TextStyle(color: textWhite, fontSize: 18.0),
                  ),
                  Text(
                    "razad7060@gamil.com",
                    style: TextStyle(color: textWhite, fontSize: 16.0),
                  ),
                  SizedBox(height: 40.0),
                  _buildRow(Icons.home, "Dashboard",() {
                    Get.to(PatientDashboard());
                  }),
                  _buildDivider(),
                  _buildRow(Icons.person_pin, "Your profile",() {
                    
                  }),
                  _buildDivider(),
                  _buildRow(Icons.message, "Contact Us",() {
                    Get.to(()=>ContactUs());
                  }),
                  _buildDivider(),
                  _buildRow(Icons.logout, "Sign Out",() async {
                    FirebaseAuth.instance.signOut().then((value) => Get.to(Choose()));
                  }),
                  _buildDivider(),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: textWhite,
    );
  }

  Widget _buildRow(IconData icon, String title,VoidCallback ontap) {
    final TextStyle tStyle = TextStyle(color: textWhite, fontSize: 16.0);
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(children: [
          Icon(
            icon,
            color: iconWhite,
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: tStyle,
          ),
        ]),
      ),
    );
  }
}
