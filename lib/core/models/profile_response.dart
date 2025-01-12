/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: profile_response
 */

class ProfileResponse {
  final String name;
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String userId;

  ProfileResponse({
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.userId,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      name: json['name'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      username: json['username'],
      userId: json['userId'],
    );
  }
}
