import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient_health_monitoring_app/screens/PatientScreens/patientlogin.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';
import 'package:patient_health_monitoring_app/utils/images.dart';
import 'package:patient_health_monitoring_app/utils/utilities.dart';
import 'package:patient_health_monitoring_app/widgets/button.dart';
import 'package:patient_health_monitoring_app/widgets/emailfield.dart';
import 'package:patient_health_monitoring_app/widgets/password.dart';
import 'package:patient_health_monitoring_app/widgets/textfield.dart';

import '../../widgets/numberField.dart';

class PatientSignup extends StatefulWidget {
  @override
  State<PatientSignup> createState() => _SignupState();
}

class _SignupState extends State<PatientSignup> {
  final _formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final ageController = TextEditingController();
  String dropdownvalue = 'Gender';

  FirebaseAuth _auth = FirebaseAuth.instance;

  var items = ['Gender','Male', 'Female', 'Other'];

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
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 35.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 85.h,),
                  Text(
                    "Patient Sign Up",
                    style: TextStyle(
                        color: textWhite,
                        fontSize: 35,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 7.h,),
                  Text(
                    "Create a new Account",
                    style: TextStyle(
                        color: textWhite,
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 130,
                  ),
                  textfeild(title: "Name", controller: nameController),
                  SizedBox(height: 10.h,),
                  Emailfeild(
                   title: "EMAIL ADDRESS", controller: emailController),
                   SizedBox(height: 10.h,),
                  Numberfeild(
                   title: "Age", controller: ageController),
                   SizedBox(height: 10.h,),
                    
                  Container(
                    height: 59.h,
                    width: 381.w,
                    decoration: BoxDecoration(
                   border: Border.all(width: 1, color: textfieldborder),
                   borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
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
                       child: Text(
                         items,
                         style: TextStyle(color: textred, fontSize: 12),
                       ),
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
                  SizedBox(height: 10.h,),
                  Password(
                   title: "Password", controller: passwordController),
                   SizedBox(height: 10.h,),
                  Container(
                   height: 59.h,
                   width: 381.w,
                   child: TextFormField(
                     keyboardType: TextInputType.text,
                     controller: confirmController,
                     decoration: InputDecoration(
                   focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(8),
                       borderSide: BorderSide(color: textfieldborder)),
                   enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(8),
                       borderSide: BorderSide(color: textfieldborder)),
                   labelText: 'Confirm Password',
                   labelStyle: TextStyle(
                     fontSize: 11,
                     color: textfieldlabel,
                   ),
                     ),
                     obscureText: true,
                     obscuringCharacter: "*",
                     style: TextStyle(
                     color: textblack,
                     fontFamily: 'Montserrat',
                     fontSize: 14),
                     validator: (value) {
                   if (value!.isEmpty) {
                     return "Enter Password";
                   }
                   if (value != passwordController.text) {
                     return 'Password Not Match';
                   }
                   return null;
                     },
                   ),
                  ),
                  SizedBox(
                    height: 44.h,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: button(
                   title: 'SignUp',
                   ontap: () {
                     if (_formkey.currentState!.validate()) {
                       _auth
                           .createUserWithEmailAndPassword(
                               email: emailController.text.toString(),
                               password: passwordController.text.toString())
                           .then((value) {
                         Utils().toastMessage("Successfully Registered");
                         Get.to(() => PatientLogin());
                       }).onError((error, stackTrace) {
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
                     Get.to(() => PatientLogin());
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
            ),
          ));
  }
}
