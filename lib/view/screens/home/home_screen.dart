import 'package:flutter/material.dart';
import 'package:flutterauthgetxstarter/modular/auth/controllers/auth_controller.dart';
import 'package:flutterauthgetxstarter/modular/reviews/controller/review_controller.dart';
import 'package:flutterauthgetxstarter/view/widgets/autoLoad/auto_load.dart';
import 'package:flutterauthgetxstarter/view/widgets/bottombar/bottom_bar.dart';
import 'package:flutterauthgetxstarter/view/widgets/nonetwork/no_network.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  // AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    print("all");
    return GetBuilder<ReviewController>(
      builder: (controller) => AutoLoad(
        onInit: controller.loadReviews,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Home"),
            actions: [
              GetBuilder<AuthController>(
                builder: (controller) => IconButton(
                  onPressed: () async {
                    await controller.logout();
                  },
                  icon: Icon(Icons.logout),
                ),
              )
            ],
          ),
          body: GetBuilder<ReviewController>(
            builder: (controller) => controller.homeScreen == false
                ? Container(
                    child: GetBuilder<ReviewController>(
                      builder: (controller) => controller.reviews?.status == 200
                          ? ListView.builder(
                              itemCount: controller.reviews?.items?.length,
                              itemBuilder: (context, i) {
                                return ListTile(
                                  title: Text(controller.reviews!.items![i].name
                                      .toString()),
                                );
                              },
                            )
                          : controller.reviews?.status == 204
                              ? Container(
                                  child: Text("Empty"),
                                )
                              : Container(),
                    ),
                  )
                : NoNetwork(
                    onInit: controller.loadReviews,
                  ),
          ),
          bottomNavigationBar: BottomMenu(
            active: 1,
          ),
        ),
      ),
    );
  }
}
