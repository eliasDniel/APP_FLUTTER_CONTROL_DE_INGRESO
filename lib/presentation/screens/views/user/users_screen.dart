import 'package:app_flutter_biometry_access/presentation/providers/user_provider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
          style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w400),
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
      body: const _ListaUsers(),
    );
  }
}

class _ListaUsers extends ConsumerStatefulWidget {
  const _ListaUsers();

  @override
  _ListaUsersState createState() => _ListaUsersState();
}

class _ListaUsersState extends ConsumerState<_ListaUsers> {
  @override
  void initState() {
    super.initState();
    ref.read(userRepositoryProvider.notifier).loadUserMethod();
  }

  @override
  Widget build(BuildContext context) {
    final users = ref.watch(userRepositoryProvider);
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final registro = users[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Card(
              child: ListTile(
                onTap: () {
                  // widget.registroProvider.selectUser(registro);
                  // context.push('/home/2/select-user');
                },
                title: Text(registro.username, style: GoogleFonts.poppins()),
                subtitle: Text(registro.email, style: GoogleFonts.poppins()),
                leading: registro.isStaff
                    ? Text('Activo', style: GoogleFonts.poppins())
                    : Text('Inactivo', style: GoogleFonts.poppins()),
                trailing: registro.isStaff
                    ? const HeroIcon(
                        HeroIcons.shieldCheck,
                        size: 24,
                        color: Colors.blue,
                      ) // Icono de administrador
                    : const HeroIcon(
                        HeroIcons.userCircle,
                        size: 24,
                        color: Colors.grey,
                      ), // Icono de usuario normal
              ),
            ),
          );
        },
      ),
    );
  }
}
