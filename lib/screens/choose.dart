import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient_health_monitoring_app/screens/PatientScreens/patientdashboard.dart';
import 'package:patient_health_monitoring_app/screens/AdminScreens/adminlogin.dart';
import 'package:patient_health_monitoring_app/screens/DoctorScreens/doctorlogin.dart';
import 'package:patient_health_monitoring_app/screens/PatientScreens/patientlogin.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';
import 'package:patient_health_monitoring_app/widgets/button.dart';

import '../utils/images.dart';
import 'AdminScreens/admindashboard.dart';
import 'DoctorScreens/doctordashboard.dart';

class Choose extends StatefulWidget {
  @override
  State<Choose> createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  final admin = FirebaseFirestore.instance.collection('Admin').snapshots();

  final doctor = FirebaseFirestore.instance.collection('Doctor').snapshots();

  final patient = FirebaseFirestore.instance.collection('Patient').snapshots();

  bool isAdmin = false;

  bool isPatient = false;

  bool isDoctor = false;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30.w, top: 50.h),
              child: Image.asset(
                logo,
                height: 150,
                width: 150,
              ),
            ),
            SizedBox(
              height: 170.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Text("Login As",
                  style: TextStyle(
                      color: textred,
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700)),
            ),
            SizedBox(
              height: 90.h,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: doctor,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  return Align(
                      alignment: Alignment.center,
                      child: button(
                        title: 'Doctor',
                        ontap: () {
                          for (int i = 0; i < snapshot.data!.docs.length; i++) {
                            if (snapshot.data!.docs[i]["email"] ==
                                FirebaseAuth.instance.currentUser!.email) {
                              isDoctor = true;
                              isAdmin = false;
                              isPatient = false;
                              setState(() {});
                            }
                          }

                          isDoctor
                              ? Get.to(() => DoctorDashboard())
                              : Get.to(() => DoctorLogin());
                        },
                      ));
                }),
            SizedBox(
              height: 30.h,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: patient,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  return Align(
                      alignment: Alignment.center,
                      child: button(
                        title: 'Patient',
                        ontap: () {
                          for (int i = 0; i < snapshot.data!.docs.length; i++) {
                            if (snapshot.data!.docs[i]["email"] ==
                                FirebaseAuth.instance.currentUser!.email) {
                              isDoctor = false;
                              isAdmin = false;
                              isPatient = true;
                              setState(() {});
                            }
                          }

                          isPatient
                              ? Get.to(() => PatientDashboard())
                              : Get.to(() => PatientLogin());
                        },
                      ));
                }),
            SizedBox(
              height: 30.h,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: admin,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  return Align(
                      alignment: Alignment.center,
                      child: button(
                        title: 'Admin',
                        ontap: () {
                          for (int i = 0; i < snapshot.data!.docs.length; i++) {
                            if (snapshot.data!.docs[i]["email"] ==
                                FirebaseAuth.instance.currentUser!.email) {
                              isDoctor = false;
                              isAdmin = true;
                              isPatient = false;
                              setState(() {});
                            }

                            isAdmin
                                ? Get.to(() => AdminDashboard())
                                : Get.to(() => AdminLogin());
                          }
                        },
                      ));
                })
          ],
        ),
      )),
    );
  }
}
