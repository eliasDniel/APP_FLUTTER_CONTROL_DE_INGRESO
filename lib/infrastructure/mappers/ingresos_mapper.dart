

import '../../domain/domain.dart';
import '../infrastructure.dart';

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
