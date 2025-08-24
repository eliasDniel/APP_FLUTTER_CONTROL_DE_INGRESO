import 'dart:convert';

import 'package:app_flutter_biometry_access/config/config.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'infrastructure/mappers/ingresos_mapper.dart';
import 'infrastructure/models/user_socket_response.dart';
import 'presentation/blocs/notifications/notifications_bloc.dart';
import 'presentation/providers/ingresos/ingresos_provider_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await NotificationsBloc.initializeFCM();
  runApp(
    ProviderScope(
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (_) => NotificationsBloc())],
        child: const MainApp(),
      ),
    ),
  );
}

final GlobalKey<ScaffoldMessengerState> messengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends ConsumerState<MainApp> {
  late final WebSocketChannel channel;

  @override
  void initState() {
    super.initState();
    channel = WebSocketChannel.connect(Uri.parse('ws://$ipServer/ws/acceso/'));

    channel.stream.listen((event) {
      final jsonInicial = jsonDecode(event);

      if (jsonInicial["mensaje"] != null) {
        // 👇 Mostrar snackbar usando el messengerKey
        messengerKey.currentState?.showSnackBar(
          SnackBar(
            content: Text(jsonInicial["mensaje"]),
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        final response = UserSocketResponse.fromJson(jsonInicial);
        final user = IngresosMapper.fromEntityToIngreso(response.data);
        ref.read(ingresosRepositoryProvider.notifier).addSocketIngreso(user);
        // 👇 Mostrar snackbar usando el messengerKey
        messengerKey.currentState?.showSnackBar(
          SnackBar(
            content: Text("Ingreso registrado: ${user.firstName} ${user.lastName}"),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: messengerKey, // 👈 Aquí se conecta
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(context),
      builder: (context, child) => HandleNotificationInteraction(child: child!),
    );
  }
}


class HandleNotificationInteraction extends StatefulWidget {
  final Widget child;
  const HandleNotificationInteraction({super.key, required this.child});

  @override
  State<HandleNotificationInteraction> createState() =>
      _HandleNotificationInteractionState();
}

class _HandleNotificationInteractionState
    extends State<HandleNotificationInteraction> {
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage = await FirebaseMessaging.instance
        .getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    context.read<NotificationsBloc>().handleRemoteMessage(message);
    final messageId =
        message.messageId?.replaceAll(';', '').replaceAll('%', '') ?? '';
    appRouter.push('/home/0/detalis/$messageId');
  }

  @override
  void initState() {
    super.initState();

    // Run code required to handle interacted messages in an async function
    // as initState() must not be async
    setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
