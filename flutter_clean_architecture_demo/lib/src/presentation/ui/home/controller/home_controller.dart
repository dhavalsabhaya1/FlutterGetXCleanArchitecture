import 'package:flutter_clean_architecture_demo/src/utils/api_service/api_url.dart';
import 'package:get/get.dart';

import '../../../../data/models/model_demo_api.dart';
import '../../../../data/repositories/repository_demo_api.dart';

class HomeController extends GetxController with StateMixin{
  RxBool isLoading = false.obs;
  RxBool hasError = false.obs;
  List<ModelDemoApi?>? modelDemoApiData;
  RepositoryDemoApi repositoryDemoApi = RepositoryDemoApi();
  Rxn<HomeController> homeController = Rxn<HomeController>();

  @override
  Future<void> onInit() async {
    super.onInit();
  await  callGetMethod();
  update();
  }

  Future<List?> callGetMethod() async {
    modelDemoApiData = [];
    change(homeController, status: RxStatus.loading());

/*    isLoading(true);
    update();*/

     modelDemoApiData = await repositoryDemoApi.callGetMethod(ApiUrl.baseUrl);
    if((modelDemoApiData ?? []).isNotEmpty){
      Future.delayed(const Duration(seconds: 2));
      // isLoading(false);
      change(homeController, status: RxStatus.success());
      return modelDemoApiData;
    }else{
      change(homeController, status: RxStatus.error());
      // hasError(true);
      return null;
    }
  }


}
