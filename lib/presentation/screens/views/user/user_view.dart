import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../providers/registro_users_entradas.dart/registero_entradas.dart';

class UserDetailScreen extends StatelessWidget {
  static const String name = 'user-view';

  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registroProvider = Provider.of<RegistroProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalle del Usuario',
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildRow(
                  "Username", registroProvider.userSeleccionado.username!),
              _buildRow("Nombre", registroProvider.userSeleccionado.firstName!),
              _buildRow(
                  "Apellido", registroProvider.userSeleccionado.lastName!),
              _buildRow("Correo", registroProvider.userSeleccionado.email!),
              _buildRow("Activo",
                  registroProvider.userSeleccionado.isActive! ? "Sí" : "No"),
              _buildRow("Staff",
                  registroProvider.userSeleccionado.isStaff! ? "Sí" : "No"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(label,
                  style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(
              flex: 3,
              child:
                  Text(value, style: const TextStyle(color: Colors.black87))),
        ],
      ),
    );
  }
}
