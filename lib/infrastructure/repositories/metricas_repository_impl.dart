import '../../domain/datasouces/metricas_data_sources.dart';
import '../../domain/entities/metricas.dart';
import '../../domain/repositories/metricas_repository.dart';

class MetricasRepositoryImpl implements MetricasRepository {
  final MetricasDataSources dataSources;

  MetricasRepositoryImpl(this.dataSources);

  @override
  Future<Metricas> getMetricas() async {
    return await dataSources.getMetricas();
  }
}
