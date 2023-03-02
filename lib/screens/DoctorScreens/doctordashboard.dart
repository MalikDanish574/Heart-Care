import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../utils/colors.dart';
import '../../widgets/drawer.dart';
import 'check_appointment.dart';

class DoctorDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String currdate = DateFormat('yMMMMd').format(DateTime.now());
    final String currday = DateFormat('EEEE').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgwhite,
        iconTheme: IconThemeData(color: iconred),
      ),
      drawer: CustomDrawer(),
      backgroundColor: bgwhite,
      body: SafeArea(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hi Malik,",
                  style: TextStyle(
                      color: textblack,
                      fontSize: 32,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              currdate + "\n" + currday,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textgrey, fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () {
                Get.to(() => CheckAppointment());
              },
              child: Container(
                height: 200.h,
                width: 160.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: textred),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Check\nAppointment",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: textWhite,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            height: 130.h,
                            width: 100.w,
                            child: Image.asset(
                              "assets/images/doctor.png",
                              fit: BoxFit.fill,
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
