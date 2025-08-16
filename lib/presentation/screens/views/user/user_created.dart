import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../providers/registro_users_entradas.dart/registero_entradas.dart';

class UserCreateScreen extends StatefulWidget {
  static const String name = 'user-created';
  const UserCreateScreen({super.key});

  @override
  State<UserCreateScreen> createState() => _UserCreateScreenState();
}

class _UserCreateScreenState extends State<UserCreateScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isActive = true;
  bool _isStaff = false;
  bool _isPasswordVisible = false; // Para la visibilidad de la contraseña
  bool _isConfirmPasswordVisible =
      false; // Para confirmar la visibilidad de la contraseña

void _submitForm(RegistroProvider registroProvider) async {
  if (_formKey.currentState!.validate()) {
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Las contraseñas no coinciden")),
      );
      return;
    }



    // Llamamos a la función del provider para registrar al usuario
    await registroProvider.registrarUsuario(
      _usernameController.text,
      _firstNameController.text,
      _lastNameController.text,
      _emailController.text,
      password,
      _isActive,
      _isStaff,
    );

    // Esperar a que el Completer se complete dentro de la misma función
    // No es necesario hacer await, ya está gestionado dentro del provider

    String responseMessage = registroProvider.message;



    // Mostrar el SnackBar con el mensaje del provider
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(responseMessage)),
    );

    // Navegar hacia atrás
    context.pop();
  }
}


  @override
  void dispose() {
    _confirmPasswordController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _usernameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registroProvider = Provider.of<RegistroProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Crear Usuario',
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Username
              TextFormField(
                controller: _usernameController,
                decoration:  InputDecoration(labelText: "Username",labelStyle:  GoogleFonts.poppins(),),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingresa un nombre de usuario";
                  }
                  return null;
                },
              ),

              // First Name
              TextFormField(
                controller: _firstNameController,
                decoration:  InputDecoration(labelText: "First Name",labelStyle:  GoogleFonts.poppins(),),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingresa el nombre";
                  }
                  return null;
                },
              ),

              // Last Name
              TextFormField(
                controller: _lastNameController,
                decoration:  InputDecoration(labelText: "Last Name",labelStyle:  GoogleFonts.poppins(),),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingresa el apellido";
                  }
                  return null;
                },
              ),

              // Email
              TextFormField(
                controller: _emailController,
                decoration:  InputDecoration(labelText: "Email",labelStyle:  GoogleFonts.poppins(),),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingresa un correo electrónico";
                  }
                  if (!RegExp(
                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                      .hasMatch(value)) {
                    return "Por favor ingresa un correo electrónico válido";
                  }
                  return null;
                },
              ),

              // Password
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelStyle:  GoogleFonts.poppins(),
                  labelText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingresa una contraseña";
                  }
                  return null;
                },
              ),

              // Confirm Password
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                decoration: InputDecoration(
                  labelStyle:  GoogleFonts.poppins(),
                  labelText: "Confirm Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor confirma la contraseña";
                  }
                  return null;
                },
              ),

              // Activo
              SwitchListTile(
                title: const Text("Activo"),
                value: _isActive,
                onChanged: (bool value) {
                  setState(() {
                    _isActive = value;
                  });
                },
              ),

              // Staff
              SwitchListTile(
                title: Text("Es Staff",style: GoogleFonts.poppins(),),
                value: _isStaff,
                onChanged: (bool value) {
                  setState(() {
                    _isStaff = value;
                  });
                },
              ),

              // Submit Button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () => _submitForm(registroProvider),
                  child:  Text("Crear Usuario",style: GoogleFonts.poppins(),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
