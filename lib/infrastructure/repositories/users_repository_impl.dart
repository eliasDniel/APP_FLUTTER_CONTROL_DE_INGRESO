


import '../../domain/domain.dart';

class UsersRepositoryImpl extends UsersRepository {
  final UsersDatasources datasources;

  UsersRepositoryImpl({required this.datasources});
  @override
  Future<List<User>> getNowUsers() {
    return datasources.getNowUsers();
  }
}
