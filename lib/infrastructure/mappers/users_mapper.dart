import 'package:app_flutter_biometry_access/infrastructure/models/regitro_entradas/users_response.dart';

import '../../domain/entities/user.dart';

class UsersMapper {
  static User formUserToEntity(UserResult user) => User(
    username: user.username,
    email: user.email,
    isStaff: user.isStaff,
    lastname: user.lastName,
    isActive: user.isActive
  );

  static UserResult fromEntityToUser(User user) => UserResult(
    username: user.username,
    firstName: user.username,
    lastName: user.lastname,
    email: user.email,
    isActive: user.isActive,
    isStaff: user.isStaff,
  );


  
}
