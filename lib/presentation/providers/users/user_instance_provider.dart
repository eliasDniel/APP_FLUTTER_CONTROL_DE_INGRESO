import 'package:app_flutter_biometry_access/infrastructure/datasources/users_datasources_impl.dart';
import 'package:app_flutter_biometry_access/infrastructure/repositories/users_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userIntanceProvider = Provider((ref) {
  return UsersRepositoryImpl(datasources: UsersDatasourcesImpl());
});
