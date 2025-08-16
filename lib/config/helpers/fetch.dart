
import 'package:dio/dio.dart';
import '../const/constantes.dart';

Future<Response<dynamic>> obtenerUsuarios(String endPoint) async {
  final dio = Dio();

  try {
    final response = await dio.get('http://$ipServer/api/$endPoint/');
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Error del servidor: Código ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error al obtener usuarios: $e');
  }
}


Future<Response<dynamic>> crearUsuario({
  required String username,
  required String firstName,
  required String lastName,
  required String email,
  required String password,
  bool isActive = true,    // Valor predeterminado: el usuario estará activo
  bool isStaff = false,    // Valor predeterminado: el usuario no será staff
}) async {
  try {
    final dio = Dio();

    // Crea el mapa de datos con todos los campos, incluyendo is_active e is_staff
    final data = {
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,  // Contraseña en texto claro
      'is_active': isActive,  // Especificamos si el usuario está activo
      'is_staff': isStaff,    // Especificamos si el usuario es staff
    };

    // Realizamos la solicitud POST para crear el usuario
    final response = await dio.post(
      'http://$ipServer/api/create_user/', 
      data: data,
    );

    // Si la respuesta es exitosa, la retornamos
    if (response.statusCode == 201) {
      return response; // Retorna la respuesta completa de la API
    } else {
      return response; // Si hay algún error, también retornamos la respuesta de error
    }
  } catch (e) {
    // Manejo de errores en la solicitud
    return Response(
      requestOptions: RequestOptions(path: ''), // Placeholder
      statusCode: 500,
      data: {'status': 'ERROR', 'message': 'Error al crear el usuario: $e'},
    );
  }
}