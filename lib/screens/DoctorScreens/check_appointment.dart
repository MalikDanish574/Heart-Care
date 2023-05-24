import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient_health_monitoring_app/screens/DoctorScreens/check_bloodpressure.dart';
import 'package:patient_health_monitoring_app/widgets/ractanaglebutton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/colors.dart';
import '../../widgets/custom_app_bar.dart';

class CheckAppointment extends StatefulWidget {
  @override
  State<CheckAppointment> createState() => _CheckAppointmentState();
}

class _CheckAppointmentState extends State<CheckAppointment> {
  final fireStore =
      FirebaseFirestore.instance.collection('Accepted Apointments').snapshots();
  final acceptedAppointment =
      FirebaseFirestore.instance.collection('Accepted Apointments');
  String? doctorName = "";
  String? email = "";
  String? gender = "";
  @override
  void initState() {
    super.initState();
    getdata();
    // Add listeners to this class
  }

  void getdata() async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    doctorName = _sharedPreferences.getString('Doctorname');
    email = _sharedPreferences.getString('Email');
    gender = _sharedPreferences.getString('Gender');
    print(doctorName);
    print(email);
    print(gender);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            SizedBox(
              height: 41.h,
            ),
            CustomAppBar(title: "Appointments", color: textred),
            SizedBox(
              height: 41.h,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: fireStore,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }

                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        if (snapshot.data!.docs[index]["Doctor Name"] ==
                            doctorName) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Container(
                                height: 255.h,
                                width: 377.w,
                                decoration: BoxDecoration(
                                    color: bgcolor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Name:",
                                            style: TextStyle(
                                                color: textWhite,
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
                                                color: textWhite,
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
                                                color: textWhite,
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
                                                " years",
                                            style: TextStyle(
                                                color: textWhite,
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
                                                color: textWhite,
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
                                                color: textWhite,
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
                                                color: textWhite,
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
                                                color: textWhite,
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
                                                color: textWhite,
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
                                                color: textWhite,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'poppins'),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RectangleBtn(
                                              title: "Check Blood Pressure",
                                              ontap: () {
                                                Get.to(() => CheckBloodPressure(
                                                      Name: snapshot
                                                              .data!.docs[index]
                                                          ["Patient Name"],
                                                      Age: snapshot.data!
                                                          .docs[index]["Age"],
                                                      Gender: snapshot
                                                              .data!.docs[index]
                                                          ["Gender"],
                                                    ));
                                              }),
                                          RectangleBtn(
                                              title: "Done",
                                              ontap: () {
                                                acceptedAppointment
                                                    .doc(snapshot
                                                        .data!.docs[index].id
                                                        .toString())
                                                    .delete();
                                              })
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
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
