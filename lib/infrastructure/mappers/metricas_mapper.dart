import 'package:app_flutter_biometry_access/domain/entities/metricas.dart';
import 'package:app_flutter_biometry_access/infrastructure/models/metricas_response.dart';

import '../../domain/entities/entrada.dart';

class MetricasMapper {
  static Metricas fromMetricasToEntity(MetricasResult metricas) => Metricas(
    registrosEntradaDia: metricas.registrosEntradaDia,
    totalUsuarios: metricas.totalUsuarios,
    registrosHuella: metricas.registrosHuella,
    registrosPin: metricas.registrosPin,
    ultimos10: metricas.ultimos10.map((e) => fromIngresoToEntity(e)).toList(),
  );

  static Ingreso fromIngresoToEntity(Ultimos10 metricas) => Ingreso(
    username: metricas.usuario.username,
    email: metricas.usuario.email,
    fechaHora: metricas.fechaHora,
    metodo: metricas.metodo,
    firstName: metricas.usuario.firstName,
    lastName: metricas.usuario.lastName,
    isActive: metricas.usuario.isActive,
    isAdmin: metricas.usuario.isStaff,
  );
}
