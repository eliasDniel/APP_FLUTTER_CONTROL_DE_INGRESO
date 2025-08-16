import 'package:app_flutter_biometry_access/domain/entities/entrada.dart';

abstract class IngresoRepository {
  Future<List<Ingreso>> getNowIngresos();
}