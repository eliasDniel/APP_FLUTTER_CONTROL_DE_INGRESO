import 'package:app_flutter_biometry_access/domain/datasouces/users_datasources.dart';
import 'package:app_flutter_biometry_access/domain/repositories/users_repository.dart';
import 'package:app_flutter_biometry_access/infrastructure/models/regitro_entradas/users_response.dart';

class UsersRepositoryImpl extends UsersRepository {
  final UsersDatasources datasources;

  UsersRepositoryImpl({required this.datasources});
  @override
  Future<List<User>> getNowUsers() {
    return datasources.getNowUsers();
  }
}
