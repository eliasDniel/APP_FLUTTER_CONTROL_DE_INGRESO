

class UserSocketResponse {
    final String status;
    final UserSocketResult data;

    UserSocketResponse({
        required this.status,
        required this.data,
    });

    factory UserSocketResponse.fromJson(Map<String, dynamic> json) => UserSocketResponse(
        status: json["status"],
        data: UserSocketResult.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class UserSocketResult {
    final String usuarioUsername;
    final String usuarioFirstName;
    final String usuarioLastName;
    final String usuarioEmail;
    final bool usuarioIsActive;
    final bool usuarioIsStaff;
    final DateTime fechaHora;
    final String metodo;

    UserSocketResult({
        required this.usuarioUsername,
        required this.usuarioFirstName,
        required this.usuarioLastName,
        required this.usuarioEmail,
        required this.usuarioIsActive,
        required this.usuarioIsStaff,
        required this.fechaHora,
        required this.metodo,
    });

    factory UserSocketResult.fromJson(Map<String, dynamic> json) => UserSocketResult(
        usuarioUsername: json["usuario__username"],
        usuarioFirstName: json["usuario__first_name"],
        usuarioLastName: json["usuario__last_name"],
        usuarioEmail: json["usuario__email"],
        usuarioIsActive: json["usuario__is_active"],
        usuarioIsStaff: json["usuario__is_staff"],
        fechaHora: DateTime.parse(json["fecha_hora"]),
        metodo: json["metodo"],
    );

    Map<String, dynamic> toJson() => {
        "usuario__username": usuarioUsername,
        "usuario__first_name": usuarioFirstName,
        "usuario__last_name": usuarioLastName,
        "usuario__email": usuarioEmail,
        "usuario__is_active": usuarioIsActive,
        "usuario__is_staff": usuarioIsStaff,
        "fecha_hora": fechaHora.toIso8601String(),
        "metodo": metodo,
    };
}
