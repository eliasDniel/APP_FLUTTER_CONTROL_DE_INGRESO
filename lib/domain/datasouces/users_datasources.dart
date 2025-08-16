
import 'package:app_flutter_biometry_access/domain/entities/user.dart';

abstract class UsersDatasources {
  Future<List<User>> getNowUsers();
}
