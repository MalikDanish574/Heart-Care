import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';
import 'package:patient_health_monitoring_app/widgets/button.dart';
import 'package:patient_health_monitoring_app/widgets/emailfield.dart';
import 'package:patient_health_monitoring_app/widgets/textfield.dart';

class ContactUs extends StatefulWidget {
  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  bool? checkedValue = false;

  final emailController = TextEditingController();

  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back_ios_new)),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Contact Us",
                style: TextStyle(
                    fontSize: 36, fontWeight: FontWeight.w600, color: textred),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Our friendly team would love to hear\nfrom you.",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w600, color: textgrey),
              ),
              SizedBox(
                height: 70.h,
              ),
              textfeild(title: "Name", controller: nameController,error: "Enter Name"),
              SizedBox(
                height: 20.h,
              ),
              Emailfeild(title: "Email", controller: emailController),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 79.h,
                width: 381.w,
                child: IntlPhoneField(
                  dropdownIcon: Icon(
                    Icons.arrow_drop_down,
                    color: textred,
                  ),
                  dropdownTextStyle: TextStyle(color: textred),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 15.h),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: textred),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: textred),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Enter phone number',
                      hintStyle: TextStyle(color: textred)),
                  initialCountryCode: 'PK',
                  controller: phoneController,
                  disableLengthCheck: true,
                ),
              ),
              Container(
                height: 89.h,
                width: 381.w,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  minLines: 1,
                  maxLines: 5,
                  controller: messageController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: textfieldborder)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: textfieldborder)),
                    labelText: 'Message',
                    labelStyle: TextStyle(
                      fontSize: 11,
                      color: textfieldlabel,
                    ),
                  ),
                  style: TextStyle(
                      color: textblack, fontFamily: 'Montserrat', fontSize: 14),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Email";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                   Checkbox(
                    side: BorderSide(
                      color: textgrey
                    ),
                    activeColor: textred ,
                    value: checkedValue,
                    onChanged: (newValue) {
                      if(checkedValue = true){
                          checkedValue = newValue;
                        }
                      setState(() {
                      });
                    },
                  ),
                  Text(
                    "You agree to our friendly privacy\npolicy.",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600, color: textgrey),
                  ),
                ],
              ),
              SizedBox(
                height: 150.h,
              ),
              Center(
                child: button(title: 'Send Message', ontap: () {
                  
                },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
