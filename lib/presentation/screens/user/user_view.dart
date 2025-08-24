import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class UserDetailScreen extends StatelessWidget {
  static const String name = 'user-view';

  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

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
            children: const [
              // _buildRow(
              //     "Username", registroProvider.userSeleccionado.username!),
              // _buildRow("Nombre", registroProvider.userSeleccionado.firstName!),
              // _buildRow(
              //     "Apellido", registroProvider.userSeleccionado.lastName!),
              // _buildRow("Correo", registroProvider.userSeleccionado.email!),
              // _buildRow("Activo",
              //     registroProvider.userSeleccionado.isActive! ? "Sí" : "No"),
              // _buildRow("Staff",
              //     registroProvider.userSeleccionado.isStaff! ? "Sí" : "No"),
            ],
          ),
        ),
      ),
    );
  }
}
