class Usuario {
  final int id;
  final String username;
  final String email;

  Usuario({required this.id, required this.username, required this.email});

  Map<String, dynamic> toJson() {
    return {'id': id, 'usuario__username': username, 'usuario__email': email};
  }
}
