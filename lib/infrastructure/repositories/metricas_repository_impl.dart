

import '../../domain/domain.dart';

class MetricasRepositoryImpl implements MetricasRepository {
  final MetricasDataSources dataSources;

  MetricasRepositoryImpl(this.dataSources);

  @override
  Future<Metricas> getMetricas() async {
    return await dataSources.getMetricas();
  }
}
