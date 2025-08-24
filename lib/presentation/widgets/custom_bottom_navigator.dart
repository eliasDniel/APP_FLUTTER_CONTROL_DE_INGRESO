


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
  });

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
      case 3:
        context.go('/home/3');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) => onItemTapped(context, value),
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedItemColor: colors.primary,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 16,  // Cambiar tamaño de la etiqueta seleccionada
      unselectedFontSize: 14,  // Cambiar tamaño de la etiqueta no seleccionada
      items: const [
        BottomNavigationBarItem(
          icon: HeroIcon(
            HeroIcons.square3Stack3d, // Dashboard icon
            style: HeroIconStyle.outline,
            size: 30, // Aumentar tamaño del icono
          ),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: HeroIcon(
            HeroIcons.signal, // Monitoreo
            style: HeroIconStyle.outline,
            size: 30, // Aumentar tamaño del icono
          ),
          label: 'Monitoreo',
        ),
        BottomNavigationBarItem(
          icon: HeroIcon(
            HeroIcons.users, // Usuarios
            style: HeroIconStyle.outline,
            size: 30, // Aumentar tamaño del icono
          ),
          label: 'Usuarios',
        ),
        BottomNavigationBarItem(
          icon: HeroIcon(
            HeroIcons.userCircle, // Perfil
            style: HeroIconStyle.outline,
            size: 30, // Aumentar tamaño del icono
          ),
          label: 'Perfil',
        ),
      ],
    );
  }
}