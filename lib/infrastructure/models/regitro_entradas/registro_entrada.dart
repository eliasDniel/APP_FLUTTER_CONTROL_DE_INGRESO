import 'dart:convert';
import 'package:intl/intl.dart';

class Usuario {
  final int id;
  final String username;
  final String email;

  Usuario({
    required this.id,
    required this.username,
    required this.email,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      username: json['username'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'usuario__username': username,
      'usuario__email': email,
    };
  }
}

class RegistroEntrada {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final bool isActive;
  final bool isAdmin;
  final String fechaHora;
  final String metodo;

  RegistroEntrada({
    required this.username,
    required this.email,
    required this.fechaHora,
    required this.metodo,
    required this.firstName,
    required this.lastName,
    required this.isActive,
    required this.isAdmin,
  });

  factory RegistroEntrada.fromJson(Map<String, dynamic> json) {
    return RegistroEntrada(
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

  static RegistroEntrada fromString(String jsonString) {
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return RegistroEntrada.fromJson(jsonMap);
  }

  // Método para formatear la fechaHora en formato "hh:mm AM/PM"
  String formatearFechaHora() {
    DateTime fechaUtc = DateTime.parse(fechaHora);  // Parseamos la fecha en formato UTC
    DateTime fechaLocal = fechaUtc.toLocal();       // Convertimos la fecha a hora local

    // Formateamos la fecha como "hh:mm AM/PM"
    String horaFormateada = DateFormat('hh:mm a').format(fechaLocal);
    return horaFormateada;
  }
}
