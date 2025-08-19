import 'package:app_flutter_biometry_access/domain/entities/metricas.dart';

abstract class MetricasDataSources {
  Future<Metricas> getMetricas();
}
