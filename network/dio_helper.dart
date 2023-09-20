import 'package:dio/dio.dart';
import 'package:hotel_reservation/network/api_constant.dart';

class DioHelper {
  static late Dio dio;
  static initDio() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUri,
        headers: {'Content -Type': 'application/json'},
        receiveDataWhenStatusError: true,
      ),
    );
  } // Dio

  static Future<Response> postDataDio({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    return await dio.post(
      url,
      data: data,
    );
  }
}
