import 'package:go_router/go_router.dart';
import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');

        return HomeScreen(pageIndex: pageIndex);
      },
      routes: [
        GoRoute(
          path: 'user-create',
          name: UserCreateScreen.name,
          builder: (context, state) => const UserCreateScreen(),
        ),
        GoRoute(
          path: 'select-user',
          name: UserDetailScreen.name,
          builder: (context, state) => const UserDetailScreen(),
        ),
        GoRoute(
          path: 'notification',
          name: NotificationsPermissions.name,
          builder: (context, state) => const NotificationsPermissions(),
        ),

        GoRoute(
          path: 'detalis/:messageId',
          name: NotificationsDetails.name,
          builder: (context, state) => NotificationsDetails(
            messageId: state.pathParameters['messageId'] ?? '',
          ),
        ),
      ],
    ),
  ],
);
