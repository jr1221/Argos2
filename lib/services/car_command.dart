import 'package:http/http.dart' as http;

import '../shared_preferences.dart';

/// true if errored
Future<bool> sendConfigCommand(String key, List<double> values) async {
  final baseUri = await SharedPreferencesClass.restore(BACKEND_URI_KEY);
  String base = '$baseUri/config/set/$key';
  base += '?data=${values.removeAt(0)}';
  for (final val in values) {
    base += '&data=$val';
  }
  final response = await http.post(Uri.parse(base));
  return response.statusCode != 200;
}
