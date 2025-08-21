import 'package:animate_do/animate_do.dart';
import 'package:app_flutter_biometry_access/presentation/providers/users/user_provider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

class UsersView extends ConsumerStatefulWidget {
  const UsersView({super.key});

  @override
  UsersViewState createState() => UsersViewState();
}

class UsersViewState extends ConsumerState<UsersView> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    ref.read(userRepositoryProvider.notifier).loadUserMethod();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final users = ref.watch(userRepositoryProvider);
    final isLoading = ref.watch(userRepositoryProvider.notifier).isLoading;
    if (isLoading) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(
                'Cargando datos...',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }
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
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: users.length,
          itemBuilder: (context, index) {
            final registro = users[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: FadeInUp(
                child: Card(
                  child: ListTile(
                    onTap: () {},
                    title: Text(
                      '${registro.username} ${registro.lastname} ',
                      style: GoogleFonts.poppins(),
                    ),
                    subtitle: Text(registro.email, style: GoogleFonts.poppins()),
                    leading: registro.isActive
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
              ),
            );
          },
        ),
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
