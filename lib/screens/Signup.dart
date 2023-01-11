
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient_health_monitoring_app/screens/choose.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';
import 'package:patient_health_monitoring_app/utils/images.dart';
import 'package:patient_health_monitoring_app/utils/utilities.dart';
import 'package:patient_health_monitoring_app/widgets/button.dart';
import 'package:patient_health_monitoring_app/widgets/emailfield.dart';
import 'package:patient_health_monitoring_app/widgets/password.dart';
import 'package:patient_health_monitoring_app/widgets/textfield.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formkey= GlobalKey<FormState>();
  final nameController= TextEditingController();
  final emailController= TextEditingController();
  final passwordController= TextEditingController();
  final confirmController= TextEditingController();
  String dropdownvalue = 'Doctor';  

  FirebaseAuth _auth =FirebaseAuth.instance;


  var items = [   
    'Doctor',
    'Patient',
  ];

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
                  padding: EdgeInsets.only(left: 35.w, top: 85.h),
                  child: Text(
                    "Sign Up",
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
                    "Create a new Account",
                    style: TextStyle(
                        color: textWhite,
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 130,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 23.w,
                  ),
                  child: textfeild(title: "Name",controller:nameController ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 23.w, top: 20.h),
                  child: Emailfeild(title: "EMAIL ADDRESS",controller: emailController),
                ),
                Container(margin: EdgeInsets.only(left: 23.w, top: 20.h),
                  height: 59.h,
                  width: 381.w,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: textfieldborder),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  
                  child:Padding(
                    padding:EdgeInsets.only(left: 10.w,right: 10.w),
                    child: DropdownButton(
                     underline: Container(),
                     isExpanded: true,
                    // Initial Value
                    value: dropdownvalue,
                    iconEnabledColor: textred,
                    icon: const Icon(Icons.keyboard_arrow_down),   
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items,style: TextStyle(
                          color: textred,
                          fontSize: 12
                        ),),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 23.w, top: 20.h),
                  child: Password(title: "Password",controller: passwordController),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 23.w, top: 20.h),
                  child: Password(title: "Confirm Password",controller: confirmController),
                ),
               
               
                SizedBox(
                  height: 64.h,
                ),
                Align(
                    alignment: Alignment.center,
                    child: button(
                      title: 'SignUp',
                      ontap: () {
                        if(_formkey.currentState!.validate()){
                          _auth.createUserWithEmailAndPassword(
                            email:emailController.text.toString() ,
                             password:passwordController.text.toString()).then((value){

                              Utils().toastMessage("Successfully Registered");
                              Get.to(()=>Choose());

                             }).onError((error, stackTrace){
                              Utils().toastMessage(error.toString());
                             });
                        }
                      },
                    )),
                     SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have an Account?",
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
                        Get.to(() => Choose());
                      },
                      child: Text(
                        "Login",
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
