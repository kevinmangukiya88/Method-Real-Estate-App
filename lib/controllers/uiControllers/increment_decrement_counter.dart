
import 'package:get/get.dart';

class IncrementDecrement extends GetxController{
  //Define all variables here that binds to activity lifetime scope
  int counter = 0;
     decrementMethod(){
    if(counter >0){
      counter --;
    }
   update();
  }
   incrementMethod(){
    if(counter < 100){
      counter ++;
    }
    update();
  }
}