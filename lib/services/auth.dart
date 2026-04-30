import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  //static const _isLoggedInKey = 'isLoggedIn';
  static const _roleKey = 'role';

  // Save session
  static Future<void> saveSession(String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_roleKey, role);
  }

  // Get role
  static Future<String> getRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_roleKey) ?? '';
  }

  // Logout / clear session
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_roleKey);
    
  }
}
