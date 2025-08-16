
import 'package:app_flutter_biometry_access/infrastructure/models/regitro_entradas/users_response.dart';

abstract class UsersDatasources {
  Future<List<User>> getNowUsers();
}
