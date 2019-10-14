import 'package:dio/dio.dart';

class DioManager {

  static DioManager _instance;

  static DioManager getInstance() {
    if (_instance == null) {
      _instance = DioManager();
    }
    return _instance;
  }

  Dio _dio = new Dio();

  DioManager() {
    _dio.options.baseUrl = "https://api.github.com";
    _dio.options.contentType = 'application/json';
    // dio.options.responseType = ResponseType.json;
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 3000;
  }

  //get请求
  void getHttp(String url, params, Function success) async {
    print('http get start');
    _dio.get(url, queryParameters: params)
      .then((Response response) {
        Map data = response.data;

        if (success != null) {
          success(data);
        }
      })
      .catchError((err) {
        print(err);
      });
  }

   //post请求
  post(String url, params) {
    return _dio.post(url, data: params);
  }
}
