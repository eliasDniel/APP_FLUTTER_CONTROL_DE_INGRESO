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

  String formatearFechaHora() {
    DateTime fechaUtc = DateTime.parse(fechaHora);
    DateTime fechaLocal = fechaUtc.toLocal();  
    String horaFormateada = DateFormat('hh:mm a').format(fechaLocal);
    return horaFormateada;
  }
  
}
