import 'package:dio/dio.dart';
import 'package:marcacion_admin/src/common/const/const.dart';

class DioConexion {
  final dio = Dio();

  Future<dynamic> get_(endpoint) async {
    Response response;
    response = await dio.get("$APIURL/$endpoint");
    return response;
  }

  Future<Response?> post_(endpoint, data) async {
    Response response;
    response = await dio.post("$APIURL/$endpoint", data: data);
    return response;
  }
}
