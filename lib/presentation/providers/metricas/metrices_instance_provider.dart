import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/datasources/metricas_datasources_impl.dart';
import '../../../infrastructure/repositories/metricas_repository_impl.dart';

final metricesInstanceProvider = Provider((ref) {
  return MetricasRepositoryImpl(MetricasDataSourcesImpl());
});
