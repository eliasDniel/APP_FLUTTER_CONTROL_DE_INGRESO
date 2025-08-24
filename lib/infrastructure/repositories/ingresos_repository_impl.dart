

import '../../domain/domain.dart';

class IngresosRepositoryImpl extends IngresoRepository {
  final IngresoDatasources datasources;

  IngresosRepositoryImpl({required this.datasources});
  @override
  Future<List<Ingreso>> getNowIngresos() {
    return datasources.getNowIngresos();
  }
}
