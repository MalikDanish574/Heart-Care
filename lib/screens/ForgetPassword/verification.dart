import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient_health_monitoring_app/screens/ForgetPassword/newpassword.dart';
import 'package:patient_health_monitoring_app/widgets/button.dart';
import 'package:pinput/pinput.dart';

import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../widgets/Appbar.dart';

class Verification extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(child: Container(
            height: MediaQuery.of(context).size.height * 0.95,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(background), fit: BoxFit.cover)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Appbar(),
                Padding(
                  padding: EdgeInsets.only(left: 25.w, top: 60.h),
                  child: Text(
                    "Email\nVerification",
                    
                    style: TextStyle(
                        color: textWhite,
                        fontSize: 35,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500),
                  ),
                ),
      
                 Align(
                  alignment: Alignment.center,
                   child: Padding(
                             padding:  EdgeInsets.only(left: 25.w,right: 25.w,top: 165),
                             child: Text(
                                 "Please check email for verification code",
                                 style: TextStyle(
                                     color: textblack,
                                     fontSize: 16,
                                     fontFamily: 'Montserrat',
                                     fontWeight: FontWeight.w500),
                               ),
                           ),
                 ),
                 SizedBox(height: 40.h,),
                 Padding(
              padding:  EdgeInsets.only(left:29.w,right:29.w),
              child: Pinput(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                defaultPinTheme: PinTheme(
                  height: 82.h,
                  width: 71.w,
                  textStyle: TextStyle(
                    color: textWhite,
                    fontSize: 26,
                    fontWeight: FontWeight.bold
                  ),
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(15),
                    color: bgcolor )
                ),
              ),
            ),
             SizedBox(height: 20.h,),
            Align(
              alignment: Alignment.center,
              child: Text(
              "Resend",
              style: TextStyle(
                  color: textred, fontSize: 15, fontWeight: FontWeight.bold),
                      ),
            ),
             SizedBox(height: 120.h,),
             Align(
              alignment: Alignment.center,
               child: button(title: 'Verify', ontap: (){
                Get.to(()=>NewPassword());
               }),
             )
            ]),
        )),
      ),
    );
  }

}