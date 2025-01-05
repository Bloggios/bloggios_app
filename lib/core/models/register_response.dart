/*
  Developer: Rohit Parihar
  Project: bloggios-mobile
  GitHub: github.com/rohit-zip
  File: register_response
 */

class RegisterResponse {
  final String message;
  final String userId;
  final String email;
  final String password;

  RegisterResponse(
      {required this.message,
      required this.userId,
      required this.email,
      required this.password});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['message'],
      userId: json['userId'],
      email: json['email'],
      password: json['password'],
    );
  }
}
