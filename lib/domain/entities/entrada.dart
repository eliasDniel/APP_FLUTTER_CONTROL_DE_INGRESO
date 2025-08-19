import 'package:intl/intl.dart';

class Ingreso {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final bool isActive;
  final bool isAdmin;
  final String fechaHora;
  final String metodo;

  Ingreso({
    required this.username,
    required this.email,
    required this.fechaHora,
    required this.metodo,
    required this.firstName,
    required this.lastName,
    required this.isActive,
    required this.isAdmin,
  });

  factory Ingreso.fromJson(Map<String, dynamic> json) {
    return Ingreso(
      username: json['usuario__username'] ?? '',
      firstName: json['usuario__first_name'] ?? '',
      lastName: json['usuario__last_name'] ?? '',
      email: json['usuario__email'] ?? '',
      isActive: json['usuario__is_active'] ?? false,
      isAdmin: json['usuario__is_staff'] ?? false,
      fechaHora: json['fecha_hora'] ?? '',
      metodo: json['metodo'] ?? '',
    );
  }

  // Método para formatear la fechaHora en formato "hh:mm AM/PM"
  String formatearFechaHora() {
    DateTime fechaUtc = DateTime.parse(fechaHora);
    DateTime fechaLocal = fechaUtc.toLocal();
    String horaFormateada = DateFormat('hh:mm a').format(fechaLocal);
    return horaFormateada;
  }

  Map<String, dynamic> toJson() {
    return {
      'usuario__username': username,
      'usuario__first_name': firstName,
      'usuario__last_name': lastName,
      'usuario__email': email,
      'usuario__is_active': isActive,
      'usuario__is_staff': isAdmin,
      'fecha_hora': fechaHora,
      'metodo': metodo,
    };
  }
}
