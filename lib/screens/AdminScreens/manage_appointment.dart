import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient_health_monitoring_app/utils/utilities.dart';

import '../../utils/colors.dart';

class ManageAppointment extends StatefulWidget {
  @override
  State<ManageAppointment> createState() => _ManageAppointmentState();
}

class _ManageAppointmentState extends State<ManageAppointment> {
  final fireStore =
      FirebaseFirestore.instance.collection('Appointments').snapshots();

  final appointment = FirebaseFirestore.instance.collection('Appointments');

  final acceptedAppointment =
      FirebaseFirestore.instance.collection('Accepted Apointments');

  final rejectedAppointment =
      FirebaseFirestore.instance.collection('Rejected Appointments');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back_ios)),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Text(
                "Manage Appointments",
                style: TextStyle(
                    color: textblack,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: fireStore,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Container(
                                height: 270.h,
                                width: 377.w,
                                decoration: BoxDecoration(
                                  color: containerbg,
                                  borderRadius: BorderRadius.circular(15.r),
                                  border: Border.all(
                                      width: 1, color: textfieldborder),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Name:",
                                            style: TextStyle(
                                                color: textred,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'poppins'),
                                          ),
                                          SizedBox(
                                            width: 60.w,
                                          ),
                                          Text(
                                            snapshot.data!
                                                .docs[index]["Patient Name"]
                                                .toString(),
                                            style: TextStyle(
                                                color: textred,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'poppins'),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Age:",
                                            style: TextStyle(
                                                color: textred,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'poppins'),
                                          ),
                                          SizedBox(
                                            width: 75.w,
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]["Age"]
                                                    .toString() +
                                                " Years",
                                            style: TextStyle(
                                                color: textred,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'poppins'),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Gender:",
                                            style: TextStyle(
                                                color: textred,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'poppins'),
                                          ),
                                          SizedBox(
                                            width: 50.w,
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]["Gender"]
                                                .toString(),
                                            style: TextStyle(
                                                color: textred,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'poppins'),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Time:",
                                            style: TextStyle(
                                                color: textred,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'poppins'),
                                          ),
                                          SizedBox(
                                            width: 65.w,
                                          ),
                                          Text(
                                            snapshot.data!
                                                .docs[index]["Appointment Time"]
                                                .toString(),
                                            style: TextStyle(
                                                color: textred,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'poppins'),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Date:",
                                            style: TextStyle(
                                                color: textred,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'poppins'),
                                          ),
                                          SizedBox(
                                            width: 65.w,
                                          ),
                                          Text(
                                            snapshot.data!
                                                .docs[index]["Appointment Date"]
                                                .toString(),
                                            style: TextStyle(
                                                color: textred,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'poppins'),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              acceptedAppointment.doc().set({
                                                'Patient Name':
                                                    snapshot.data!.docs[index]
                                                        ["Patient Name"],
                                                'Age': snapshot
                                                    .data!.docs[index]["Age"],
                                                'Gender': snapshot.data!
                                                    .docs[index]["Gender"],
                                                'Doctor Name': snapshot.data!
                                                    .docs[index]["Doctor Name"],
                                                'Appointment Time':
                                                    snapshot.data!.docs[index]
                                                        ["Appointment Time"],
                                                'Appointment Date':
                                                    snapshot.data!.docs[index]
                                                        ["Appointment Date"],
                                                'Hospital Name':
                                                    snapshot.data!.docs[index]
                                                        ["Hospital Name"],
                                                'Hospital Address':
                                                    snapshot.data!.docs[index]
                                                        ["Hospital Address"],
                                                'Doctor phone':
                                                    snapshot.data!.docs[index]
                                                        ["Doctor phone"],
                                                'Patient email':
                                                    snapshot.data!.docs[index]
                                                        ["Patient email"],
                                              }).then((value) {
                                                Utils()
                                                    .toastMessage("Accepted");
                                              }).onError((error, stackTrace) {
                                                Utils().toastMessage(
                                                    error.toString());
                                              });

                                              appointment
                                                  .doc(snapshot
                                                      .data!.docs[index].id
                                                      .toString())
                                                  .delete();

                                              setState(() {});
                                            },
                                            child: Container(
                                              height: 50.h,
                                              width: 150.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.r),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: textWhite),
                                                  color: containerbggreen),
                                              child: Center(
                                                child: Text(
                                                  "Accept",
                                                  style: TextStyle(
                                                      color: textWhite,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'poppins'),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              rejectedAppointment.doc().set({
                                                'Patient Name':
                                                    snapshot.data!.docs[index]
                                                        ["Patient Name"],
                                                'Age': snapshot
                                                    .data!.docs[index]["Age"],
                                                'Gender': snapshot.data!
                                                    .docs[index]["Gender"],
                                                'Doctor Name': snapshot.data!
                                                    .docs[index]["Doctor Name"],
                                                'Appointment Time':
                                                    snapshot.data!.docs[index]
                                                        ["Appointment Time"],
                                                'Appointment Date':
                                                    snapshot.data!.docs[index]
                                                        ["Appointment Date"],
                                                'Hospital Name':
                                                    snapshot.data!.docs[index]
                                                        ["Hospital Name"],
                                                'Hospital Address':
                                                    snapshot.data!.docs[index]
                                                        ["Hospital Address"],
                                                'Doctor phone':
                                                    snapshot.data!.docs[index]
                                                        ["Doctor phone"],
                                                'Patient email':
                                                    snapshot.data!.docs[index]
                                                        ["Patient email"],
                                              }).then((value) {
                                                Utils()
                                                    .toastMessage("Rejected");
                                              }).onError((error, stackTrace) {
                                                Utils().toastMessage(
                                                    error.toString());
                                              });

                                              appointment
                                                  .doc(snapshot
                                                      .data!.docs[index].id
                                                      .toString())
                                                  .delete();
                                            },
                                            child: Container(
                                              height: 50.h,
                                              width: 150.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.r),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: textWhite),
                                                  color: bgcolor),
                                              child: Center(
                                                child: Text(
                                                  "Reject",
                                                  style: TextStyle(
                                                      color: textWhite,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'poppins'),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                })
          ],
        ),
      ),
    );
  }
}
