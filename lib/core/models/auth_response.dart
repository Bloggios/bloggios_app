/*
  Developer: Rohit Parihar
  Project: bloggios_mobile
  GitHub: github.com/rohit-zip
  File: auth_response.dart
 */

class AuthResponse {
  final String accessToken;
  final String? userId;
  final String clientId;

  AuthResponse({
    required this.accessToken,
    this.userId,
    required this.clientId,
  });
}
