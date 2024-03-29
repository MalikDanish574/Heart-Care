import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:patient_health_monitoring_app/screens/DoctorScreens/doctorlogin.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';
import 'package:patient_health_monitoring_app/utils/images.dart';
import 'package:patient_health_monitoring_app/utils/utilities.dart';
import 'package:patient_health_monitoring_app/widgets/button.dart';
import 'package:patient_health_monitoring_app/widgets/emailfield.dart';
import 'package:patient_health_monitoring_app/widgets/password.dart';
import 'package:patient_health_monitoring_app/widgets/textfield.dart';

import '../../widgets/Appbar.dart';
import '../../widgets/numberField.dart';

class DoctorSignup extends StatefulWidget {
  @override
  State<DoctorSignup> createState() => _SignupState();
}

class _SignupState extends State<DoctorSignup> {
  final _formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final ageController = TextEditingController();
  final specializationController = TextEditingController();
  final hospitalNameController = TextEditingController();
  final hospitalLocationController = TextEditingController();
  final phoneNoController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  String dropdownvalue = 'Gender';

  FirebaseAuth _auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance.collection('Doctor');

  var items = ['Gender', 'Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.95,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(background), fit: BoxFit.cover)),
              ),
              Form(
                key: _formkey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Appbar(),
                      SizedBox(
                        height: 55.h,
                      ),
                      Text(
                        "Doctor Sign Up",
                        style: TextStyle(
                            color: textWhite,
                            fontSize: 35,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Text(
                        "Create a new Account",
                        style: TextStyle(
                            color: textWhite,
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 120,
                      ),
                      textfeild(
                          title: "Name",
                          controller: nameController,
                          error: "Enter Name"),
                      SizedBox(
                        height: 10.h,
                      ),
                      Emailfeild(
                          title: "EMAIL ADDRESS", controller: emailController),
                      SizedBox(
                        height: 10.h,
                      ),
                      Numberfeild(title: "Age", controller: ageController),
                      SizedBox(
                        height: 10.h,
                      ),
                      textfeild(
                          title: "Spaecialization",
                          controller: specializationController,
                          error: "Enter Specialization"),
                      SizedBox(
                        height: 10.h,
                      ),
                      textfeild(
                          title: "Hospital Name",
                          controller: hospitalNameController,
                          error: "Enter Hospital Name"),
                      SizedBox(
                        height: 10.h,
                      ),
                      textfeild(
                          title: "Hospital Location",
                          controller: hospitalLocationController,
                          error: "Enter Location"),
                      SizedBox(
                        height: 10.h,
                      ),
                      Numberfeild(
                          title: "Phone Number", controller: phoneNoController),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 59.h,
                        width: 381.w,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: textfieldborder),
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
                                  style:
                                      TextStyle(color: textred, fontSize: 12),
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
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 59.h,
                            width: 180.w,
                            child: TextFormField(
                              controller: startTimeController,
                              //editing controller of this TextField
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          BorderSide(color: textfieldborder)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          BorderSide(color: textfieldborder)),
                                  prefixIcon: Icon(
                                    Icons.timer,
                                    color: iconred,
                                  ), //icon of text field
                                  labelText: "Start Time",
                                  labelStyle: TextStyle(
                                      color: textred) //label text of field
                                  ),
                              readOnly:
                                  true, //set it true, so that user will not able to edit text
                              onTap: () async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  initialTime: TimeOfDay.now(),
                                  context: context,
                                );

                                if (pickedTime != null) {
                                  print(pickedTime
                                      .format(context)); //output 10:51 PM
                                  DateTime parsedTime = DateFormat.jm().parse(
                                      pickedTime.format(context).toString());
                                  //converting to DateTime so that we can further format on different pattern.
                                  print(
                                      parsedTime); //output 1970-01-01 22:53:00.000
                                  String formattedTime =
                                      DateFormat('HH:mm:ss').format(parsedTime);
                                  print(formattedTime); //output 14:59:00
                                  //DateFormat() is from intl package, you can format the time on any pattern you need.

                                  setState(() {
                                    startTimeController.text =
                                        formattedTime; //set the value of text field.
                                  });
                                } else {
                                  print("Time is not selected");
                                }
                              },
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 59.h,
                            width: 180.w,
                            child: TextFormField(
                              controller: endTimeController,
                              //editing controller of this TextField
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          BorderSide(color: textfieldborder)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          BorderSide(color: textfieldborder)),
                                  prefixIcon: Icon(
                                    Icons.timer,
                                    color: iconred,
                                  ), //icon of text field
                                  labelText: "End Time",
                                  labelStyle: TextStyle(
                                      color: textred) //label text of field
                                  ),
                              readOnly:
                                  true, //set it true, so that user will not able to edit text
                              onTap: () async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  initialTime: TimeOfDay.now(),
                                  context: context,
                                );

                                if (pickedTime != null) {
                                  print(pickedTime
                                      .format(context)); //output 10:51 PM
                                  DateTime parsedTime = DateFormat.jm().parse(
                                      pickedTime.format(context).toString());
                                  //converting to DateTime so that we can further format on different pattern.
                                  print(
                                      parsedTime); //output 1970-01-01 22:53:00.000
                                  String formattedTime =
                                      DateFormat('HH:mm:ss').format(parsedTime);
                                  print(formattedTime); //output 14:59:00
                                  //DateFormat() is from intl package, you can format the time on any pattern you need.

                                  setState(() {
                                    endTimeController.text =
                                        formattedTime; //set the value of text field.
                                  });
                                } else {
                                  print("Time is not selected");
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Password(
                          title: "Password", controller: passwordController),
                      SizedBox(
                        height: 10.h,
                      ),
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
                                        password:
                                            passwordController.text.toString())
                                    .then((value) {
                                  fireStore.doc().set({
                                    'name': nameController.text.toString(),
                                    'email': emailController.text.toString(),
                                    'age': ageController.text.toString(),
                                    'Gender': dropdownvalue,
                                    'password':
                                        passwordController.text.toString(),
                                    'id': fireStore.doc().id,
                                    'Role': 'doctor',
                                    'Hospital Name':
                                        hospitalNameController.text.toString(),
                                    'Hospital Location':
                                        hospitalLocationController.text
                                            .toString(),
                                    'Phone Number':
                                        phoneNoController.text.toString(),
                                    'Start Time':
                                        startTimeController.text.toString(),
                                    'End Time':
                                        endTimeController.text.toString(),
                                    'Specialization': specializationController
                                        .text
                                        .toString(),
                                  });
                                  Utils()
                                      .toastMessage("Successfully Registered");
                                  Get.to(() => DoctorLogin());
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
                              Get.to(() => DoctorLogin());
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
                      SizedBox(
                        height: 20.h,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
