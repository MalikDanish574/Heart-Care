import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient_health_monitoring_app/screens/DoctorScreens/doctordashboard.dart';
import 'package:patient_health_monitoring_app/utils/utilities.dart';
import 'package:patient_health_monitoring_app/widgets/button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../../utils/colors.dart';
import '../../widgets/custom_app_bar.dart';

// ignore: must_be_immutable
class CheckBloodPressure extends StatefulWidget {
  String Name;
  String Age;
  String Gender;
  CheckBloodPressure({
    required this.Name,
    required this.Age,
    required this.Gender,
  });
  @override
  State<CheckBloodPressure> createState() => _CheckBloodPressureState();
}

class _CheckBloodPressureState extends State<CheckBloodPressure> {
  final _formkey = GlobalKey<FormState>();
  final fireStore = FirebaseFirestore.instance.collection('PatientDetails');
  DateTime date = DateTime.now();

  String? doctorName = "";

  int upperBP = 144;

  int lowerBP = 85;

  int heartRate = 55;

 
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String time = "${date.hour}:${date.minute}:${date.second}";

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 41.h,
                ),
                CustomAppBar(title: "Blood Pressure", color: textred),
                SizedBox(
                  height: 41.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10.h,
                      width: 10.h,
                      decoration: BoxDecoration(
                          color: bgcolor,
                          borderRadius: BorderRadius.circular(10.r)),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "High",
                      style: TextStyle(
                          color: textblack,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      height: 10.h,
                      width: 10.h,
                      decoration: BoxDecoration(
                          color: containerbggreen,
                          borderRadius: BorderRadius.circular(10.r)),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "Normal",
                      style: TextStyle(
                          color: textblack,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10.h,
                      width: 10.h,
                      decoration: BoxDecoration(
                          color: orange,
                          borderRadius: BorderRadius.circular(10.r)),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "Low",
                      style: TextStyle(
                          color: textblack,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text(
                      "Upper Blood Pessure  :",
                      style: TextStyle(
                          color: textblack,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    Spacer(),
                    Container(
                      height: 40.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: upperBP > 140
                              ? bgcolor
                              : upperBP < 90
                                  ? orange
                                  : containerbggreen),
                      child: Center(
                        child: Text(
                          upperBP.toString(),
                          style: TextStyle(
                              color: textWhite,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text(
                      "Lower Blood Pessure  :",
                      style: TextStyle(
                          color: textblack,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    Spacer(),
                    Container(
                      height: 40.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: lowerBP > 90
                              ? bgcolor
                              : lowerBP < 60
                                  ? orange
                                  : containerbggreen),
                      child: Center(
                        child: Text(
                          lowerBP.toString(),
                          style: TextStyle(
                              color: textWhite,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text(
                      "Heart Rate :",
                      style: TextStyle(
                          color: textblack,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 80.w,
                    ),
                    Container(
                      height: 40.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: heartRate > 100
                              ? bgcolor
                              : heartRate < 60
                                  ? orange
                                  : containerbggreen),
                      child: Center(
                        child: Text(
                          heartRate.toString(),
                          style: TextStyle(
                              color: textWhite,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  "Patient Details",
                  style: TextStyle(
                      color: textblack,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name     :",
                          style: TextStyle(
                              color: textblack,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Age         :",
                          style: TextStyle(
                              color: textblack,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Gender   :",
                          style: TextStyle(
                              color: textblack,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.Name,
                          style: TextStyle(
                              color: textblack,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          widget.Age,
                          style: TextStyle(
                              color: textblack,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          widget.Gender,
                          style: TextStyle(
                              color: textblack,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 200.h,
                ),
                button(
                  title: "Done",
                  ontap: () {
                    if (_formkey.currentState!.validate()) {
                      fireStore.doc().set({
                        "name": widget.Name,
                        "age": widget.Age,
                        "gender": widget.Gender,
                        "bpLower": upperBP,
                        "bpUpper": lowerBP,
                        "heartRate": heartRate,
                        "checkedBy": doctorName,
                        "date": DateFormat('yMMMMd').format(DateTime.now()),
                        "time": time
                      }).then((value) {
                        Utils().toastMessage("Successfully Added");
                        Get.to(() => DoctorDashboard());
                      });
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
