import 'package:app_flutter_biometry_access/config/const/constantes.dart';
import 'package:app_flutter_biometry_access/domain/datasouces/users_datasources.dart';
import 'package:app_flutter_biometry_access/infrastructure/models/regitro_entradas/users_response.dart';
import 'package:dio/dio.dart';

class UsersDatasourcesImpl extends UsersDatasources {
    final dio = Dio(BaseOptions(baseUrl: 'http://$ipServer/api'));
  @override
  Future<List<User>> getNowUsers() async {
    final response = await dio.get('/users');
    return [];
  }
}
