

class MetricasResponse {
  final String status;
  final MetricasResult data;

  MetricasResponse({
    required this.status,
    required this.data,
  });

  // Función para crear el objeto ApiResponse desde el JSON
  factory MetricasResponse.fromJson(Map<String, dynamic> json) {
    return MetricasResponse(
      status: json['status'],
      data: MetricasResult.fromJson(json['data']),
    );
  }

  // Función para convertir el objeto ApiResponse en un JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
    };
  }
}

class MetricasResult {
  final int registrosEntradaDia;
  final int totalUsuarios;
  final int usuariosActivos;
  final int usuariosInactivos;
  final int registrosHuella;
  final int registrosPin;

  MetricasResult({
    required this.registrosEntradaDia,
    required this.totalUsuarios,
    required this.usuariosActivos,
    required this.usuariosInactivos,
    required this.registrosHuella,
    required this.registrosPin,
  });

  // Función para crear el objeto Data desde el JSON
  factory MetricasResult.fromJson(Map<String, dynamic> json) {
    return MetricasResult(
      registrosEntradaDia: json['registros_entrada_dia'],
      totalUsuarios: json['total_usuarios'],
      usuariosActivos: json['usuarios_activos'],
      usuariosInactivos: json['usuarios_inactivos'],
      registrosHuella: json['registros_huella'],
      registrosPin: json['registros_pin'],
    );
  }

  // Función para convertir el objeto Data en un JSON
  Map<String, dynamic> toJson() {
    return {
      'registros_entrada_dia': registrosEntradaDia,
      'total_usuarios': totalUsuarios,
      'usuarios_activos': usuariosActivos,
      'usuarios_inactivos': usuariosInactivos,
      'registros_huella': registrosHuella,
      'registros_pin': registrosPin,
    };
  }
}