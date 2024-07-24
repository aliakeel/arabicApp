import 'package:get/get.dart';

class AuthController extends GetxController{

  RxBool login = true.obs;

  loginToggle(){
    login.toggle();
    update();
  }
}