import 'package:flutter/material.dart';
import 'package:flutterauthgetxstarter/modular/auth/controllers/auth_controller.dart';
import 'package:flutterauthgetxstarter/view/widgets/autoLoad/auto_load.dart';
import 'package:flutterauthgetxstarter/view/widgets/nonetwork/no_network.dart';
import 'package:get/get.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) => AutoLoad(
        onInit: () async {
          await controller.autoLogin();
        },
        child: Scaffold(
          body: GetBuilder<AuthController>(
            builder: (controller) => controller.startScreen == false
                ? Container(
                    alignment: Alignment.center,
                    child: Text("First"),
                  )
                : NoNetwork(
                    onInit: controller.autoLogin,
                  ),
          ),
        ),
      ),
    );
  }
}
