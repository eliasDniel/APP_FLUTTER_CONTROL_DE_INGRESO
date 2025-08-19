import 'package:app_flutter_biometry_access/domain/datasouces/metricas_data_sources.dart';
import 'package:app_flutter_biometry_access/infrastructure/models/metricas_response.dart';
import 'package:dio/dio.dart';

import '../../config/const/constantes.dart';
import '../../domain/entities/metricas.dart';
import '../mappers/metricas_mapper.dart';

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
