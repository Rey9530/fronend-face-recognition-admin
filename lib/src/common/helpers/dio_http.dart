import 'package:dio/dio.dart';
import 'package:marcacion_admin/src/common/const/const.dart';
import 'package:marcacion_admin/src/common/services/services.dart';

class DioConexion {
  static final Dio _dio = Dio();

  static void configureDio() {
    // Base del url
    _dio.options.baseUrl = APIURL;

    // Configurar Headers
    _dio.options.headers = {
      'Authorization': 'Bearer ${LocalStorage.prefs.getString('token') ?? ''}'
    };
  }

  static Future get_(String endpoint) async {
    Response response;
    response = await _dio.get(endpoint);
    return response.data;
  }

  static Future post_(String endpoint, Map<String, dynamic> data) async {
    // final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.post(endpoint, data: data);
      return resp.data;
    } catch (e) {
      print(e);
      throw ('Error en el POST');
    }
  }
}
