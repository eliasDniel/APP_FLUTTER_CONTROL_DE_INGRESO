

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/infrastructure.dart';

final ingresosIntanceProvider = Provider((ref) {
  return IngresosRepositoryImpl(datasources: IngresosDatasourcesImpl());
});
