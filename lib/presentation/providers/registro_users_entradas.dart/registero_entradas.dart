// import 'dart:async';
// import 'package:flutter/material.dart';
// import '../../../config/helpers/fetch.dart';
// import '../../../infrastructure/models/metricas_response.dart';
// import '../../../infrastructure/models/regitro_entradas/registro_entrada.dart';
// import '../../../infrastructure/models/regitro_entradas/registro_response.dart';
// import '../../../infrastructure/models/regitro_entradas/users_response.dart';

// class RegistroProvider extends ChangeNotifier {
//   List<RegistroEntrada> listaMonitoreo = [];
//   List<UserResult> users = [];
//   // UserResult userSeleccionado = UserResult();
//   int totalIngresos = 0;
//   int admin = 0;
//   int totalUsuarios = 0;
//   int userNormales = 0;
//   int ingresosPorHuella = 0;
//   int ingresosPorPIN = 0;
//   bool isLoading = false;
//   bool isLoadingUser = false;
//   bool isLoadingMetricas = false;
//   String message = '';
//   void obtenerRegistros() async {
//     isLoading = true;
//     try {
//       final response = await obtenerUsuarios('usuarios');
//       final entradas = RegistroEntradaResponse.fromJson(response.data);
//       listaMonitoreo = entradas.registros
//           .map(
//             (registro) => RegistroEntrada(
//                 username: registro.username,
//                 email: registro.email,
//                 fechaHora: registro.fechaHora,
//                 metodo: registro.metodo,
//                 firstName: registro.firstName,
//                 isActive: registro.isActive,
//                 isAdmin: registro.isAdmin,
//                 lastName: registro.lastName),
//           )
//           .toList();
//       isLoading = false;
//       notifyListeners();
//     } catch (e) {}
//   }

//   void obtenerMtericas() async {
//     isLoadingMetricas = true;
//     try {
//       final response = await obtenerUsuarios('metrica_ingresos');
//       final metricas = MetricasResponse.fromJson(response.data);
//       totalIngresos = metricas.data.registrosEntradaDia;
//       totalUsuarios = metricas.data.totalUsuarios;

//       ingresosPorHuella = metricas.data.registrosHuella;
//       ingresosPorPIN = metricas.data.registrosPin;
//       isLoadingMetricas = false;
//       notifyListeners();
//     } catch (e) {}
//   }

//   void selectUser(UserResult user) {
//     // userSeleccionado = user;
//     notifyListeners();
//   }

//   void obtenerUserDjango() async {
//     isLoadingUser = true;
//     try {
//       final response = await obtenerUsuarios('users');
//       final entradas = UserResponse.fromJson(response.data);
//       users = entradas.users
//           .map(
//             (user) => UserResult(
//                 username: user.username,
//                 email: user.email,
//                 firstName: user.firstName,
//                 isActive: user.isActive,
//                 isStaff: user.isStaff,
//                 lastName: user.lastName),
//           )
//           .toList();
//       isLoadingUser = false;
//       notifyListeners();
//     } catch (e) {}
//   }

//   // Método para registrar usuario y usar un Completer dentro de la función
//   Future<void> registrarUsuario(
//     String username,
//     String firstName,
//     String lastName,
//     String email,
//     String password,
//     bool isActive,
//     bool isStaff,
//   ) async {
//     // Creamos el Completer dentro de la función
//     Completer<void> completer = Completer<void>();

//     // Indicamos que estamos cargando
//     isLoadingUser = true;
//     notifyListeners();

//     try {
//       // Llamamos al servicio para registrar el usuario
//       var response = await crearUsuario(
//         username: username,
//         firstName: firstName,
//         lastName: lastName,
//         email: email,
//         password: password,
//         isActive: isActive,
//         isStaff: isStaff,
//       );

//       final body = UserCreateResponse.fromJson(response.data);

//       if (body.status == "ERROR") {
//         isLoadingUser = false;
//         message = body.message; // Error al crear usuario
//         notifyListeners();
//         completer.complete(); // Completa el Completer indicando que terminó
//         return;
//       }

//       users = [body.user, ...users];
//       message = body.message; // Usuario creado correctamente
//       isLoadingUser = false;
//       notifyListeners();

//       completer.complete(); // Completa el Completer indicando que terminó
//     } catch (e) {
//       message =
//           'Ocurrió un error al crear el usuario'; // Mensaje de error en caso de fallo
//       isLoadingUser = false;
//       notifyListeners();
//       completer.complete(); // Completa el Completer en caso de error
//     }

//     // Esperamos que el Completer se complete antes de retornar
//     await completer.future;
//   }

//   void inicializar() {
//     isLoading = false;
//     listaMonitoreo = [];
//     notifyListeners();
//   }

//   void inicializarUsers() {
//     isLoadingUser = false;
//     users = [];
//     notifyListeners();
//   }

//   void addMonitoreoDesdeSocket(RegistroEntrada registroEntrada) {
//     listaMonitoreo = [registroEntrada, ...listaMonitoreo];
//     notifyListeners();
//   }
// }
