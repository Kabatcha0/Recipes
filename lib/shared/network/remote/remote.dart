import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "https://tasty.p.rapidapi.com/",
        receiveDataWhenStatusError: true));
  }

  static Future<Response> getData(
      {required String path, String? key, String? search}) async {
    dio.options.headers = {
      'X-RapidAPI-Key': '23c2d84dffmshec49318cfd90f63p1f2d45jsn5ed0e7993a61',
      'X-RapidAPI-Host': 'tasty.p.rapidapi.com'
    };
    return await dio.get(path,
        queryParameters: search == null ? null : {key!: search});
  }
}
