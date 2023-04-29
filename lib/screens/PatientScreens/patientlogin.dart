import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient_health_monitoring_app/screens/PatientScreens/patientdashboard.dart';
import 'package:patient_health_monitoring_app/screens/PatientScreens/patientSignup.dart';

import 'package:patient_health_monitoring_app/utils/colors.dart';
import 'package:patient_health_monitoring_app/utils/images.dart';
import 'package:patient_health_monitoring_app/utils/utilities.dart';
import 'package:patient_health_monitoring_app/widgets/button.dart';
import 'package:patient_health_monitoring_app/widgets/emailfield.dart';
import 'package:patient_health_monitoring_app/widgets/password.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/Appbar.dart';
import '../ForgetPassword/forgetPasword.dart';

class PatientLogin extends StatelessWidget  {
  
  bool exist = false;
  String email = "";
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fireStore =
      FirebaseFirestore.instance.collection('Patient').snapshots();
  final _auth = FirebaseAuth.instance;
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

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
          child: Form(
            key: _formkey,
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
                    "Patient Login",
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
                  height: 160,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 23.w),
                  child: Emailfeild(
                    title: "EMAIL ADDRESS",
                    controller: emailController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 23.w, top: 20.h),
                  child: Password(
                      title: "Password", controller: passwordController),
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
                        Get.to(() => ForgetPassword());
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
                SizedBox(
                  height: 64.h,
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: fireStore,
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    return Align(
                        alignment: Alignment.center,
                        child: button(
                          title: 'Login',
                          ontap: () {
                            email = emailController.text;
                            if (_formkey.currentState!.validate()) {
                              _auth
                                  .signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text)
                                  .then((value) async {
                                    if(!snapshot.hasData){
                                      CircularProgressIndicator();
                                    }
                                for (int i = 0;
                                    i < snapshot.data!.docs.length;
                                    i++) {
                                  if (email ==
                                      snapshot.data!.docs[i]["email"]) {
                                    exist = true;
                                    final SharedPreferences _sharedPreferences=await SharedPreferences.getInstance();
                                    _sharedPreferences.setString("patientname","${snapshot.data!.docs[i]["name"]}");
                                    _sharedPreferences.setString("email","${snapshot.data!.docs[i]["email"]}");
                                    _sharedPreferences.setString("age","${snapshot.data!.docs[i]["age"].toString()}");
                                    _sharedPreferences.setString("gender","${snapshot.data!.docs[i]["gender"].toString()}");
                                  
                                  print(_sharedPreferences.getString("name"));
                                  
                                  }
                                }
                                exist
                                    ? Get.to(() => PatientDashboard())
                                    : Utils().toastMessage("invalid email");
                              }).onError((error, stackTrace) {
                                Utils().toastMessage(error.toString());
                              });
                            }
                          },
                        ));
                  },
                ),
                SizedBox(
                  height: 153.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Have an Account?",
                      style: TextStyle(
                          color: textblack,
                          fontSize: 13,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => PatientSignup());
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(
                            color: textred,
                            fontSize: 13,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
