class User {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  bool? isActive;
  bool? isStaff;

  User({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.isActive,
    this.isStaff,
  });

  // Factory constructor to create a User from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      isActive: json['is_active'],
      isStaff: json['is_staff'],
    );
  }

  // Method to convert User object to JSON map
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'is_active': isActive,
      'is_staff': isStaff,
    };
  }
}

class UserResponse {
  List<User> users;

  UserResponse({required this.users});

  // Factory constructor to create a UserResponse from JSON
  factory UserResponse.fromJson(Map<String, dynamic> json) {
    var list = json['users'] as List;
    List<User> usersList = list.map((i) => User.fromJson(i)).toList();

    return UserResponse(
      users: usersList,
    );
  }

  // Method to convert UserResponse to JSON
  Map<String, dynamic> toJson() {
    return {
      'users': users.map((user) => user.toJson()).toList(),
    };
  }
}


class UserCreateResponse {
  String status;
  String message;
  User user;

  UserCreateResponse({
    required this.status,
    required this.message,
    required this.user,
  });

  // Factory constructor to create a UserResponse from JSON
  factory UserCreateResponse.fromJson(Map<String, dynamic> json) {
    return UserCreateResponse(
      status: json['status'],
      message: json['message'],
      user: User.fromJson(json['user']),
    );
  }

  // Method to convert UserResponse to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'user': user.toJson(),
    };
  }
}