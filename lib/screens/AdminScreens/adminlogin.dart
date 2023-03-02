import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient_health_monitoring_app/screens/AdminScreens/admindashboard.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';
import 'package:patient_health_monitoring_app/utils/images.dart';
import 'package:patient_health_monitoring_app/widgets/button.dart';
import 'package:patient_health_monitoring_app/widgets/emailfield.dart';
import 'package:patient_health_monitoring_app/widgets/password.dart';
import 'package:patient_health_monitoring_app/widgets/textfield.dart';

import '../../utils/utilities.dart';
import '../../widgets/Appbar.dart';
import '../ForgetPassword/forgetPasword.dart';

class AdminLogin extends StatelessWidget {
  final _formkey=GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  final _auth= FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
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
                padding: EdgeInsets.only(left: 20.w, top: 15.h),
                child: Appbar(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 35.w, top: 65.h),
                child: Text(
                  "Admin Login",
                  style: TextStyle(
                      color: textWhite,
                      fontSize: 35,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 35.w, top: 7.h),
                child: Text(
                  "Please login to Continue",
                  style: TextStyle(
                      color: textWhite,
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 180,
              ),
              Padding(
                padding: EdgeInsets.only(left: 23.w),
                child: Emailfeild(title: "EMAIL ADDRESS",controller:emailController),
              ),
              Padding(
                padding: EdgeInsets.only(left: 23.w, top: 20.h),
                child: Password(title: "Password",controller: passwordController,),
              ),
              SizedBox(
                height: 14.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 33.w),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: (() {
                      Get.to(()=>ForgetPassword());
                    }),
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                          color: textblack,
                          fontSize: 11,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 64.h,),
              Align(
                alignment: Alignment.center,
                  child: button(
                title: 'Login',ontap: () {
                   if(_formkey.currentState!.validate()){
                        _auth.signInWithEmailAndPassword(
                          email: emailController.text, 
                          password: passwordController.text).then((value) {
                            Get.to(()=>AdminDashboard());
                          }).onError((error, stackTrace){
                            Utils().toastMessage(error.toString());
                          });
                    }
                },
              )),
              
              
            ],
          ),
        ),
      ),
    ));
  }
}