import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';

import '../../../providers/registro_users_entradas.dart/registero_entradas.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    final registroProvider = Provider.of<RegistroProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/home/2/user-create');
            },
            icon: const HeroIcon(HeroIcons.userPlus),
          ),
        ],
      ),
      body: _ListaUsers(registroProvider: registroProvider),
    );
  }
}

class _ListaUsers extends StatefulWidget {
  final RegistroProvider registroProvider;
  const _ListaUsers({required this.registroProvider});

  @override
  State<_ListaUsers> createState() => _ListaUsersState();
}

class _ListaUsersState extends State<_ListaUsers> {
  @override
  void initState() {
    super.initState();
    widget.registroProvider.obtenerUserDjango();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.registroProvider.isLoadingUser &&
        widget.registroProvider.users.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(
                'Cargando registros...',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }

    if (!widget.registroProvider.isLoadingUser &&
        widget.registroProvider.users.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Text(
            'No hay registros aún 😶‍🌫️',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        widget.registroProvider.inicializarUsers();
        widget.registroProvider.obtenerUserDjango();
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: widget.registroProvider.users.length,
        itemBuilder: (context, index) {
          final registro = widget.registroProvider.users[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Card(
              child: ListTile(
                onTap: () {
                  widget.registroProvider.selectUser(registro);
                  context.push('/home/2/select-user');
                },
                title: Text("${registro.firstName} ${registro.lastName}",style: GoogleFonts.poppins(),),
                subtitle: Text(registro.email!,style: GoogleFonts.poppins(),),
                leading: registro.isActive!
                    ? Text('Activo',style: GoogleFonts.poppins(),)
                    : Text('Inactivo',style: GoogleFonts.poppins(),),
                trailing: registro.isStaff!
                    ? const HeroIcon(HeroIcons.shieldCheck,
                        size: 24, color: Colors.blue) // Icono de administrador
                    : const HeroIcon(HeroIcons.userCircle,
                        size: 24,
                        color: Colors.grey), // Icono de usuario normal
              ),
            ),
          );
        },
      ),
    );
  }
}
