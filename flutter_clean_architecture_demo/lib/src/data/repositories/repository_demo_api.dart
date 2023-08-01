import '../../utils/api_service/api_provider.dart';
import '../models/model_demo_api.dart';

class RepositoryDemoApi {
  List<ModelDemoApi>? modelDemoApiData;

  Future<List<ModelDemoApi?>> callGetMethod(String url) async {
    await APIManager.instance
        .getRequest(
      requestURL: url,
      isAuthRequired: true,
    )
        .then((response) {
      modelDemoApiData =
          List<ModelDemoApi>.from(response.map((model) => ModelDemoApi.fromJson(model)));
    });
    return modelDemoApiData ?? [];
  }
}
