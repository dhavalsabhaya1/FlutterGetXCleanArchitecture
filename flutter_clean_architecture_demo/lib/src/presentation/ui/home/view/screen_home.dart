import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../details/view/screen_details.dart';
import '../controller/home_controller.dart';

class ScreenHome extends GetView<HomeController> {
  const ScreenHome({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    ///tag is used to find the instance with the tag
    /// this will be in the memory during the lifecycle
    /// this is use to inject dependency and instantiate the controller
    /// isSingleton
    HomeController controller = Get.put(HomeController());

    ///[Get.lazyPut()] will put when you need it
    /// fenix shows that it can be destroyed when no longer needed
    /// and reconstructed when it is needed again
    /// isSingleton
    // Get.lazyPut(() => HomeController(),fenix: true,tag:"random" );

    ///This will be used when there is any async tasks
    // Get.putAsync(() => HomeController());

    ///This is a non singleton approach
    // Get.create(() =>  HomeController())

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await  controller.callGetMethod();
                     controller.update();
                    /*NavigatorKey.navigatorKey.currentState!
                      .pushNamed(AppRoutes.routesScreenDetails, arguments: testText);*/
                  },
                  child: const Text("Refresh")),
            ],
          ),

          /// To use [GetBuilder] we must have to call update() method
          /// which works exactly the same like setState
          /// it updates the ui with update()
              GetBuilder<HomeController>(builder: (_) {
            if (controller.status.isLoading) {
              return const CircularProgressIndicator();
            } else if (controller.status.isError) {
              return const Text("Something went wrong");
            } else {
              return (controller.modelDemoApiData ?? []).isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.modelDemoApiData!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            Get.to(ScreenDetails(
                                demoText:
                                    controller.modelDemoApiData![index]!.name ?? ""));
                          },
                          title: Text(controller.modelDemoApiData![index]!.name ?? ""),
                          subtitle:
                              Text(controller.modelDemoApiData![index]!.email ?? ""),
                        );
                      },
                    )
                  : const Text("No data found");
              // }
            }
          })

          /// to use [GetX] we must have to user .obs
          /// on the change on those .obs variables our ui will be automatically updated
          /// We don't have to instantiate any controller to use this
          /* GetX<HomeController>(
            builder: (cont) {
              if (cont.isLoading.isTrue) {
                return const CircularProgressIndicator();
              } else if (cont.hasError.isTrue) {
                return const Text("Something went wrong");
              } else {
                return (cont.modelDemoApiData ?? []).isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.modelDemoApiData!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Get.to(ScreenDetails(
                                  demoText:
                                  cont.modelDemoApiData![index]!.name ?? ""));
                            },
                            title: Text(cont.modelDemoApiData![index]!.name ?? ""),
                            subtitle:
                                Text(controller.modelDemoApiData![index]!.email ?? ""),
                          );
                        },
                      )
                    : const Text("No data found");
                // }
              }
            },
          )*/

          /// It works as same as GetX
          /// but the difference is We must must have to initialize the controller as
          /// it does not provide builder
          /// works with the change of the .obs variables
    /*      Obx(() {
            if (controller.isLoading.isTrue) {
              return const Center(child: CircularProgressIndicator());
            } else if (controller.hasError.isTrue) {
              return const Text("Something went wrong");
            } else {
              return (controller.modelDemoApiData ?? []).isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.modelDemoApiData!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            Get.to(ScreenDetails(
                                demoText:
                                    controller.modelDemoApiData![index]!.name ?? ""));
                          },
                          title: Text(controller.modelDemoApiData![index]!.name ?? ""),
                          subtitle:
                              Text(controller.modelDemoApiData![index]!.email ?? ""),
                        );
                      },
                    )
                  : const Text("No data found");
              // }
            }
          })*/
        ],
      ),
    );
  }
}
