import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient_health_monitoring_app/screens/PatientScreens/patientlogin.dart';
import 'package:patient_health_monitoring_app/utils/utilities.dart';
import 'package:patient_health_monitoring_app/widgets/Appbar.dart';
import 'package:patient_health_monitoring_app/widgets/button.dart';
import 'package:patient_health_monitoring_app/widgets/emailfield.dart';


import '../../utils/colors.dart';
import '../../utils/images.dart';

class ForgetPassword extends StatelessWidget {
  final _formkey=GlobalKey<FormState>();
  final emailController = TextEditingController();
  final auth= FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.95,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(background), fit: BoxFit.cover)),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Appbar(),
                  Padding(
                    padding: EdgeInsets.only(left: 25.w, top: 60.h),
                    child: Text(
                      "Forget\nPassword",
                      
                      style: TextStyle(
                          color: textWhite,
                          fontSize: 35,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 200.h,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 20.w),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Email for verification",
                          style: TextStyle(
                              color: textred,
                              fontSize: 24,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500),
                        ),
                         Padding(
                           padding:  EdgeInsets.only(left: 25.w,right: 25.w,top: 15),
                           child: Text(
                               "Please enter email to send the verification code",
                               style: TextStyle(
                                   color: textblack,
                                   fontSize: 16,
                                   fontFamily: 'Montserrat',
                                   fontWeight: FontWeight.w500),
                             ),
                         ),
                         SizedBox(height: 50.h,),
                    Emailfeild(title: 'Enter Email',controller: emailController),
                    SizedBox(height: 100.h,),
                    button(title: 'Send Verification Code', ontap: () {
                      if(_formkey.currentState!.validate()){
                        auth.sendPasswordResetEmail(email: emailController.text.toString()).then((value){
                          Utils().toastMessage("Successfully send Email");
                        }).onError((error, stackTrace) {
                          Utils().toastMessage(error.toString());
                        });

                      }
                      Get.to(()=>PatientLogin());
                    },)
                      ],
                    ),
                  ),
                 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
