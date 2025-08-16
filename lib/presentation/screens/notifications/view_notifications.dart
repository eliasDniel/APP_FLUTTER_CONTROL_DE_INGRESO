
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/notifications/notifications_bloc.dart';

class NotificationsPermissions extends StatefulWidget {
  static const String name = 'notification';
  const NotificationsPermissions({super.key});

  @override
  State<NotificationsPermissions> createState() =>
      _NotificationsPermissionsState();
}

class _NotificationsPermissionsState extends State<NotificationsPermissions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context
            .select((NotificationsBloc bloc) => Text('${bloc.state.status}')),
        actions: [
          IconButton(
              onPressed: () {
                context.read<NotificationsBloc>().requestPermissions();
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final notifications =
        context.watch<NotificationsBloc>().state.notifications;
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return ListTile(
          title: Text(notification.title),
          subtitle: Text(notification.body),
          // leading: Image.network(notification.imageUrl!),
          onTap: () {
            context.push('/home/0/detalis/${notification.messageId}');
          },
        );
      },
    );
  }
}
