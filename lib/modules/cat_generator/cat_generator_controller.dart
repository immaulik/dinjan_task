import 'package:dinjan_task/widgets/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class CatGeneratorController extends GetxController {
  Dio dio = Dio();
  RxBool isLoading = false.obs;
  RxString imageUrl = "".obs;

  @override
  void onInit() {
    super.onInit();
    generateCat();
  }

  Future<void> generateCat() async {
    try {
      isLoading.value = true;
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["x-api-key"] =
          "live_VONi29hkMDxePpz6u1kJHQBH63uUeoUylBUWKoPiWEpy2HnGozYAbtI7lH2vEin7";
      var res = await dio.get(
          "https://api.thecatapi.com/v1/images/search?size=med&mime_types=jpg&format=json&has_breeds=true&order=RANDOM&page=0&limit=1");
      if (res.statusCode == 200) {
        isLoading.value = false;
        List<dynamic> list = res.data;
        imageUrl.value = list.first["url"];
        print("imageUrl.value  ===> ${imageUrl.value}");
      }
    } on DioException catch (e) {
      isLoading.value = false;
      String error = handleDioError(e.type);
      imageUrl.value = error;
      showCustomSnackBar(
        title: "Error",
        subTitle: error,
        type: SnackBarType.error,
      );
    }
  }

  String handleDioError(DioExceptionType errorType) {
    String error;

    switch (errorType) {
      case DioExceptionType.connectionTimeout:
        error = 'The request took too long to complete.';
        break;
      case DioExceptionType.sendTimeout:
        error = 'The request could not be sent in the allotted time.';
        break;
      case DioExceptionType.receiveTimeout:
        error = 'The response took too long to arrive.';
        break;
      case DioExceptionType.badCertificate:
        error = 'The SSL certificate is invalid.';
        break;
      case DioExceptionType.badResponse:
        error = 'The server responded with an unexpected status.';
        break;
      case DioExceptionType.cancel:
        error = 'The request was cancelled before completion.';
        break;
      case DioExceptionType.connectionError:
        error = 'Failed to connect to the server.';
        break;
      case DioExceptionType.unknown:
        error = 'An unexpected error occurred.';
        break;
      default:
        error = 'An unexpected error occurred.';
        break;
    }

    return error;
  }
}
