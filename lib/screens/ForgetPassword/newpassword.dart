import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient_health_monitoring_app/screens/choose.dart';
import 'package:patient_health_monitoring_app/widgets/button.dart';
import 'package:patient_health_monitoring_app/widgets/textfield.dart';

import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../widgets/Appbar.dart';

class NewPassword extends StatelessWidget {
  final confirmNewController = TextEditingController();
  final newPasswordController = TextEditingController();
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
            Appbar( ),
            Padding(
              padding: EdgeInsets.only(left: 25.w, top: 60.h),
              child: Text(
                "New\nPassword",
                style: TextStyle(
                    color: textWhite,
                    fontSize: 35,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.w, top: 180.h),
              child: Column(
                children: [
                  textfeild(title: 'New Password',controller: newPasswordController),
                  SizedBox(height: 20.h,),
                  textfeild(title: 'Confirm New Password',controller: confirmNewController,),
                  SizedBox(height: 70.h,),
                  button(
                    title: 'Set New Password',
                    ontap: () {
                      Get.to(()=>Choose());
                    },
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
