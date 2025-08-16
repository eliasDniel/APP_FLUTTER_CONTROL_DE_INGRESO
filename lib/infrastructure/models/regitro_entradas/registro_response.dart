import 'registro_entrada.dart';

class RegistroEntradaResponse {
  final List<RegistroEntrada> registros;

  RegistroEntradaResponse({required this.registros});

  factory RegistroEntradaResponse.fromJson(Map<String, dynamic> json) {
    return RegistroEntradaResponse(
      registros: (json['registros_entradas'] as List)
          .map((item) => RegistroEntrada.fromJson(item))
          .toList(),
    );
  }
}
