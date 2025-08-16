import 'package:app_flutter_biometry_access/config/const/constantes.dart';
import 'package:app_flutter_biometry_access/domain/datasouces/ingresos_datasources.dart';
import 'package:app_flutter_biometry_access/domain/entities/entrada.dart';
import 'package:app_flutter_biometry_access/infrastructure/mappers/ingresos_mapper.dart';
import 'package:app_flutter_biometry_access/infrastructure/models/regitro_entradas/registro_response.dart';
import 'package:dio/dio.dart';

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
