
import 'package:app_flutter_biometry_access/domain/entities/user.dart';
import 'package:app_flutter_biometry_access/infrastructure/models/regitro_entradas/users_response.dart';

class MetricasResponse {
    final String status;
    final MetricasResult data;

    MetricasResponse({
        required this.status,
        required this.data,
    });

    factory MetricasResponse.fromJson(Map<String, dynamic> json) => MetricasResponse(
        status: json["status"],
        data: MetricasResult.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class MetricasResult {
    final int registrosEntradaDia;
    final int totalUsuarios;
    final int registrosHuella;
    final int registrosPin;
    final List<Ultimos10> ultimos10;

    MetricasResult({
        required this.registrosEntradaDia,
        required this.totalUsuarios,
        required this.registrosHuella,
        required this.registrosPin,
        required this.ultimos10,
    });

    factory MetricasResult.fromJson(Map<String, dynamic> json) => MetricasResult(
        registrosEntradaDia: json["registros_entrada_dia"].toInt(),
        totalUsuarios: json["total_usuarios"].toInt(),
        registrosHuella: json["registros_huella"].toInt(),
        registrosPin: json["registros_pin"].toInt(),
        ultimos10: List<Ultimos10>.from(json["ultimos_10"].map((x) => Ultimos10.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "registros_entrada_dia": registrosEntradaDia,
        "total_usuarios": totalUsuarios,
        "registros_huella": registrosHuella,
        "registros_pin": registrosPin,
        "ultimos_10": List<dynamic>.from(ultimos10.map((x) => x.toJson())),
    };
}

class Ultimos10 {
  final int id;
  final UserResult usuario;
  final String fechaHora;
  final String metodo;

  Ultimos10({
    required this.id,
    required this.usuario,
    required this.fechaHora,
    required this.metodo,
  });

  factory Ultimos10.fromJson(Map<String, dynamic> json) => Ultimos10(
        id: json["id"],
        usuario: UserResult.fromJson(json["usuario"]), // 👈 objeto usuario
        fechaHora: json["fecha_hora"],
        metodo: json["metodo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "usuario": usuario.toJson(),
        "fecha_hora": fechaHora,
        "metodo": metodo,
      };
}
