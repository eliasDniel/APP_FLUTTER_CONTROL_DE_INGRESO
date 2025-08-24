import 'package:dio/dio.dart';
import '../../config/config.dart';
import '../../domain/domain.dart';
import '../infrastructure.dart';

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
