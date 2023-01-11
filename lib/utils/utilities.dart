import 'package:fluttertoast/fluttertoast.dart';
import 'package:patient_health_monitoring_app/utils/colors.dart';

class Utils{
void toastMessage(String message){

   Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor:bgcolor,
        textColor:textWhite,
        fontSize: 16.0
    );

}


 
}