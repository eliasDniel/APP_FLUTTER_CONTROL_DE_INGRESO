
import 'package:dio/dio.dart';
import '../../config/config.dart';
import '../../domain/domain.dart';
import '../infrastructure.dart';

class IngresosDatasourcesImpl extends IngresoDatasources {
  final dio = Dio(BaseOptions(baseUrl: 'http://$ipServer/api'));
  @override
  Future<List<Ingreso>> getNowIngresos() async {
    final response = await dio.get('/usuarios');
    final ingresosResponse = RegistroEntradaResponse.fromJson(response.data);
    return ingresosResponse.registros
        .map((e) => IngresosMapper.fromIngresoToEntity(e))
        .toList();
  }
}
