import 'package:flutterauthgetxstarter/modular/auth/controllers/auth_controller.dart';
import 'package:flutterauthgetxstarter/modular/auth/controllers/news_controller.dart';
import 'package:flutterauthgetxstarter/modular/reviews/controller/review_controller.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<ReviewController>(ReviewController());
    Get.put<NewsController>(NewsController());
  }
}
