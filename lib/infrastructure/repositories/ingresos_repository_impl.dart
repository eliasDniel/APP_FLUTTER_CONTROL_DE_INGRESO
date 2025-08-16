import 'package:app_flutter_biometry_access/domain/datasouces/ingresos_datasources.dart';
import 'package:app_flutter_biometry_access/domain/entities/entrada.dart';
import 'package:app_flutter_biometry_access/domain/repositories/ingreso_repository.dart';

class IngresosRepositoryImpl extends IngresoRepository {
  final IngresoDatasources datasources;

  IngresosRepositoryImpl({required this.datasources});
  @override
  Future<List<Ingreso>> getNowIngresos() {
    return datasources.getNowIngresos();
  }
}
