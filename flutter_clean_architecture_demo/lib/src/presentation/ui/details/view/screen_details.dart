import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_demo/src/presentation/ui/home/controller/home_controller.dart';
import 'package:flutter_clean_architecture_demo/src/utils/app_colors.dart';
import 'package:get/get.dart';

class ScreenDetails extends StatelessWidget {
  final String demoText;

  const ScreenDetails({Key? key, required this.demoText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.find<HomeController>().callGetMethod();
              },
              child: const Text("Refresh")),
          Container(
            color: AppColors.primaryWhite,
            child: Text(
                "Get.find<HomeController>().modelDemoApiData length -- ${Get.find<HomeController>().modelDemoApiData?.length}"),
          ),
          Container(
            color: AppColors.primaryWhite,
            child: Text(demoText),
          ),
        ],
      ),
    );
  }
}
