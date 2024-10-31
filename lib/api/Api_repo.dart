import 'package:dio/dio.dart';

class ApiRepo {
  final String url;
  Map<String, dynamic>? payload;

  ApiRepo({required this.url});

  final Dio _dio = Dio();

  void get(
    Function(dynamic data) onSuccess,
    Function(dynamic data) onError,
  ) async {
    print('url is $url');
    await _dio.get(url, queryParameters: payload).then((response) {
      print(
          'ApiRepo, there was a success get operation, with data ${response.data}');
      onSuccess(response.data);
    }).catchError((error) {
      print('ApiRepo, there was a failed get operation, with error $error');
      error(error);
    });
  }
}
