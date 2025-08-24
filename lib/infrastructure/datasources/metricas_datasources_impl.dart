import 'package:dio/dio.dart';
import '../../config/config.dart';
import '../../domain/domain.dart';
import '../infrastructure.dart';

class MetricasDataSourcesImpl implements MetricasDataSources {
  final dio = Dio(BaseOptions(baseUrl: 'http://$ipServer/api'));
  @override
  Future<Metricas> getMetricas() async {
    final response = await dio.get('/metrica_ingresos');
    final metricasResponse = MetricasResponse.fromJson(response.data);
    final metricas = MetricasMapper.fromMetricasToEntity(metricasResponse.data);
    return metricas;
  }
}
