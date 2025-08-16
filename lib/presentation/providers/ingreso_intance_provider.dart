import 'package:app_flutter_biometry_access/infrastructure/datasources/ingresos_datasources_impl.dart';
import 'package:app_flutter_biometry_access/infrastructure/repositories/ingresos_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ingresosIntanceProvider = Provider((ref) {
  return IngresosRepositoryImpl(datasources: IngresosDatasourcesImpl());
});
