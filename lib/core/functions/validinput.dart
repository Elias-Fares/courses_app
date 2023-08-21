import 'package:get/get.dart';

validInput(String type , String value , int min, int max ){
  if (type == "email") {
    if(!GetUtils.isEmail(value)) {
      return "not valid Email";
    }
  }
  if (type == "phonenum"){
    if (!GetUtils.isPhoneNumber(value)){
      return "not valid phone number";
    }
  }
  if (type == "username"){
    if (!GetUtils.isUsername(value)){
      return "not valid username";
    }
  }
  if (value.length > max){
    return "Can't be larger than $max ";
  }
  if (value.length < min){
    return"Can't be smaller than $min";
  }
  if (value.isEmpty){
    return "the fieled is empty";
  }
}