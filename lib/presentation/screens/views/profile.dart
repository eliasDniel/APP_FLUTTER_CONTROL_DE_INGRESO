import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tecnologias = [
      'Dart',
      'Flutter',
      'Django',
      'PostgreSQL',
      'Firebase',
      'WebSocket',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perfil del Usuario',
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Colors.indigo,
                child: CircleAvatar(
                  radius: 52,
                  backgroundImage: NetworkImage(
                    'https://lh3.googleusercontent.com/a/AEdFTp7xhp7j6smuCe4NEmImXGZp3BgKV3NCXyqlIuB9=s96-c', // 🔁 Reemplaza con tu URL de imagen
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Elias Ramos',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              'er9335037@gmail.com',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[700]),
            ),
            const Divider(height: 40, thickness: 1.5),
            _buildInfoTile('Fecha de nacimiento', '25 de mayo del 2004'),
            _buildInfoTile('Número de celular', '0981837825'),
            _buildInfoTile('Carrera', 'Ingeniería en Software'),
            _buildInfoTile('Usuario', 'eliasramos'),
            _buildInfoTile('Activo', 'Sí'),
            _buildInfoTile('Staff', 'Sí'),

            const SizedBox(height: 20),
            Text(
              'Tecnologías que uso',
              style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tecnologias
                  .map((tec) => Chip(
                        label: Text(tec, style: GoogleFonts.poppins()),
                        backgroundColor: Colors.indigo[100],
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(String title, String value) {
    return ListTile(
      leading: const Icon(Icons.info_outline),
      title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
      subtitle: Text(value, style: GoogleFonts.poppins()),
    );
  }
}
