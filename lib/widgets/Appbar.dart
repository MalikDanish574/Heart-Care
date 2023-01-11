import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';

class Appbar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(onPressed: (){
        Get.back();
      }, icon: Icon(Icons.arrow_back_ios_new,color:iconWhite,)),
    );
  }

}