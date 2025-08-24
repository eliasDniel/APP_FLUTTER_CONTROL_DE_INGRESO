import 'package:app_flutter_biometry_access/domain/entities/entrada.dart';
import '../models/regitro_entradas/registro_response.dart';
import '../models/user_socket_response.dart';

class IngresosMapper {
  static Ingreso fromIngresoToEntity(IngresoResult ingreso) => Ingreso(
    username: ingreso.username,
    email: ingreso.email,
    fechaHora: ingreso.fechaHora,
    metodo: ingreso.metodo,
    firstName: ingreso.firstName,
    lastName: ingreso.lastName,
    isActive: ingreso.isActive,
    isAdmin: ingreso.isAdmin,
  );


  static Ingreso fromEntityToIngreso(UserSocketResult ingreso) => Ingreso(
    username: ingreso.usuarioUsername,
    email: ingreso.usuarioEmail,
    fechaHora: ingreso.fechaHora.toString(),
    metodo: ingreso.metodo,
    firstName: ingreso.usuarioFirstName,
    lastName: ingreso.usuarioLastName,
    isActive: ingreso.usuarioIsActive,
    isAdmin: ingreso.usuarioIsStaff,
  );

}
