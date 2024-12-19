import 'package:shared_preferences/shared_preferences.dart';


const String BACKEND_URI_KEY = 'v1_BackendUri';
const String BACKEND_URI_DEFAULT = 'http://192.168.100.11:8000';

class SharedPreferencesClass {
  static Future<Object?> restore(String key) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.get(key);
  }

  static save(String key, dynamic value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    if (value is bool) {
      sharedPrefs.setBool(key, value);
    } else if (value is String) {
      sharedPrefs.setString(key, value);
    } else if (value is int) {
      sharedPrefs.setInt(key, value);
    } else if (value is double) {
      sharedPrefs.setDouble(key, value);
    } else if (value is List<String>) {
      sharedPrefs.setStringList(key, value);
    } else {
      print('Failed to find value type to store!');
    }
  }
}
