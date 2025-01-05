/*
  Developer: Rohit Parihar
  Project: bloggios_mobile
  GitHub: github.com/rohit-zip
  File: module_response.dart.dart
 */

class ModuleResponse {
  final String message;
  final String userId;
  final String? id;

  ModuleResponse({required this.message, required this.userId, this.id});

  factory ModuleResponse.fromJson(Map<String, dynamic> json) {
    return ModuleResponse(
      message: json['message'],
      userId: json['userId'],
      id: json['id'] as String?,
    );
  }
}
