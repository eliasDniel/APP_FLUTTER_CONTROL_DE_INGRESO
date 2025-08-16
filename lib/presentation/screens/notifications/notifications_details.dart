import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/push_message.dart';
import '../../blocs/notifications/notifications_bloc.dart';

class NotificationsDetails extends StatelessWidget {
  static const String name = 'notification-view';
  final String messageId;
  const NotificationsDetails({super.key, required this.messageId});

  @override
  Widget build(BuildContext context) {
    final PushMessage? pushMessage =
        context.watch<NotificationsBloc>().getMessage(messageId);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalles Push'),
        ),
        body: (pushMessage != null)
            ? _Details(pushMessage: pushMessage)
            : const Center(
                child: Text('PushMessage no existe'),
              ));
  }
}

class _Details extends StatelessWidget {
  final PushMessage pushMessage;
  const _Details({required this.pushMessage});

// Widget build method para mostrar el PushMessage
  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          if (pushMessage.imageUrl != null)
            Image.network(pushMessage.imageUrl!),
          const SizedBox(height: 30),
          Text(pushMessage.title, style: textStyles.titleMedium),
          Text(pushMessage.body),
          const Divider(),
          Text(pushMessage.data.toString()),
        ],
      ),
    ); // Padding
  }
}
