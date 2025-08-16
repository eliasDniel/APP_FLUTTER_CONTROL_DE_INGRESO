import 'package:app_flutter_biometry_access/domain/datasouces/users_datasources.dart';
import 'package:app_flutter_biometry_access/domain/entities/user.dart';
import 'package:app_flutter_biometry_access/domain/repositories/users_repository.dart';


class UsersRepositoryImpl extends UsersRepository {
  final UsersDatasources datasources;

  UsersRepositoryImpl({required this.datasources});
  @override
  Future<List<User>> getNowUsers() {
    return datasources.getNowUsers();
  }
}
