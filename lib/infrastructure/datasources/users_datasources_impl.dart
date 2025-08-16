import 'package:app_flutter_biometry_access/config/const/constantes.dart';
import 'package:app_flutter_biometry_access/domain/datasouces/users_datasources.dart';
import 'package:app_flutter_biometry_access/domain/entities/user.dart';
import 'package:app_flutter_biometry_access/infrastructure/mappers/users_mapper.dart';
import 'package:app_flutter_biometry_access/infrastructure/models/regitro_entradas/users_response.dart';
import 'package:dio/dio.dart';

class UsersDatasourcesImpl extends UsersDatasources {
  final dio = Dio(BaseOptions(baseUrl: 'http://$ipServer/api'));
  @override
  Future<List<User>> getNowUsers() async {
    final response = await dio.get('/users');

    final userResponse = UserResponse.fromJson(response.data);
    final users = userResponse.users
        .map((e) => UsersMapper.formUserToEntity(e))
        .toList();

    return users;
  }
}
