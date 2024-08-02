import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferenceService {
  // Private constructor
  LocalPreferenceService._();

  // Singleton instance variable
  static final LocalPreferenceService _instance = LocalPreferenceService._();

  // Getter for the singleton instance
  static LocalPreferenceService get instance => _instance;

  // SharedPreferences object
  late SharedPreferences _prefs;

  // Initialize SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Methods for getting and setting preferences

  ///for get token
  String getToken() {
    return _prefs.getString("token") ?? '';
  }

  ///for set token
  Future<void> setToken({required String token}) async {
    await _prefs.setString('token', token);
  }

  ///for remove token
  Future<void> removeToken() async {
    await _prefs.remove("token");
  }
}
