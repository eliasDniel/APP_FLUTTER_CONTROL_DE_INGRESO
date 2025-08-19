



import 'package:app_flutter_biometry_access/domain/entities/entrada.dart';

class Metricas {
    final int registrosEntradaDia;
    final int totalUsuarios;
    final int registrosHuella;
    final int registrosPin;
    final List<Ingreso> ultimos10;

    Metricas({
        required this.registrosEntradaDia,
        required this.totalUsuarios,
        required this.registrosHuella,
        required this.registrosPin,
        required this.ultimos10,
    });

    factory Metricas.fromJson(Map<String, dynamic> json) => Metricas(
        registrosEntradaDia: json["registros_entrada_dia"],
        totalUsuarios: json["total_usuarios"],
        registrosHuella: json["registros_huella"],
        registrosPin: json["registros_pin"],
        ultimos10: List<Ingreso>.from(json["ultimos_10"].map((x) => Ingreso.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "registros_entrada_dia": registrosEntradaDia,
        "total_usuarios": totalUsuarios,
        "registros_huella": registrosHuella,
        "registros_pin": registrosPin,
        "ultimos_10": List<dynamic>.from(ultimos10.map((x) => x.toJson())),
    };
}