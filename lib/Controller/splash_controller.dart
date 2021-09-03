import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:youtube_downloder/Screens/home_screen.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      Get.off(() => HomeScreen(), transition: Transition.fade);
    });
  }
}
