/*
  Developer: Rohit Parihar
  Project: bloggios_mobile
  GitHub: github.com/rohit-zip
  File: cookie_utils.dart
 */

class CookieUtils {
  static String parseRefreshToken(String cookies) {
    var cookieList = cookies.split(',');
    String refreshTokenCookie = cookieList.firstWhere(
      (cookie) => cookie.contains("local-refresh-token__mgmt"),
      orElse: () => '',
    );
    if (refreshTokenCookie.isNotEmpty) {
      var cookieParts = refreshTokenCookie.split(';');
      String refreshToken = cookieParts[0].split('=')[1];
      return refreshToken;
    } else {
      return '';
    }
  }
}
