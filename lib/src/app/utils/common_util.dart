import 'dart:convert';
import 'dart:io';

class CommonUtil {

  /// fill [path] with full path, filename and extension for use method
  /// [readFileAsString]. For example you can use this method with full path
  /// like assets/jsons/file_json.json
  static String readFileAsString(String path) => File(path).readAsStringSync();

  ///
  /// [jsonIsValid] to check value from map is a JSON
  ///
  static bool jsonIsValid(Map<String, dynamic>? test) {
    if (test == null) return false;

    try {
      json.encode(test);
    } catch (_) {
      return false;
    }

    return true;
  }
}
