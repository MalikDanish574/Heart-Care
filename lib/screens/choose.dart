import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient_health_monitoring_app/screens/Dashbords/patientdashboard.dart';
import 'package:patient_health_monitoring_app/screens/loginScreens/adminlogin.dart';
import 'package:patient_health_monitoring_app/screens/loginScreens/doctorlogin.dart';
import 'package:patient_health_monitoring_app/screens/loginScreens/patientlogin.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';
import 'package:patient_health_monitoring_app/widgets/button.dart';

import '../utils/images.dart';
import 'Dashbords/admindashboard.dart';
import 'Dashbords/doctordashboard.dart';

class Choose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.95,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(background), fit: BoxFit.cover)),

                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 50.w,top: 50.h),
                        child: Image.asset(logo,height: 120,width: 80,),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 20.w),
                        child: Text("IoT based Blood pressure\nmonitoring system",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textWhite,
                          fontSize: 15,
                          fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700)
                        ),),
                        SizedBox(height: 170.h,),
                       Align(
                        alignment: Alignment.center,
                         child: Text("Login As",
                         
                         style: TextStyle(
                           color: textred,
                           fontSize: 24,
                           fontFamily: 'Montserrat',
                                             fontWeight: FontWeight.w700)
                         ),
                       ),
                       SizedBox(height: 90.h,),

                       Align(
                        alignment: Alignment.center,
                        child: button(title: 'Doctor',ontap: (){
                           if (FirebaseAuth.instance.currentUser!=null){
                                Get.to(()=>DoctorDashboard());
                              }else{
                                Get.to(()=>DoctorLogin());
                              }
                        },)),
                        SizedBox(height: 30.h,),
                      Align(
                        alignment: Alignment.center,
                        child: button(title: 'Patient',ontap: (){
                          if (FirebaseAuth.instance.currentUser!=null){
                                Get.to(()=>PatientDashboard());
                              }else{
                                Get.to(()=>PatientLogin());
                              }
                        },)),
                        SizedBox(height: 30.h,),
                       Align(
                        alignment: Alignment.center,
                        child: button(title: 'Admin',ontap: (){
                          if (FirebaseAuth.instance.currentUser!=null){
                                Get.to(()=>AdminDashboard());
                              }else{
                                Get.to(()=>AdminLogin());
                              }
                        },))
                    ],
                  ),
      )),
    );
  }
}
