import 'dart:convert';
import 'dart:developer';

import 'package:bloc_example_03/domain/auth_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class _Key {
  static const String accessToken = 'accessToken';
  static Map<String, dynamic> defaultValues = {_Key.accessToken: ''};
}

class Preference {
  static final Preference _preference = Preference._();

  factory Preference() => _preference;

  Preference._();

  static late final SharedPreferences _instance;
  static final String tokenInitialValue = _Key.defaultValues[_Key.accessToken];

  static const String _userKey = "user-key";

  static bool get isTokenAvailable => accessToken.isNotEmpty;

  static Future<void> init() async {
    try {
      _instance = await SharedPreferences.getInstance();
    } catch (error) {
      log('Error: $error');
      rethrow;
    }
  }

  static AuthDataModel get authModel => AuthDataModel.fromMap(jsonDecode(_instance.getString(_userKey)!));

  static Future<bool> saveAuthDataModel(AuthDataModel model) async {
    log('saving auth model: ${model.toMap()}');
    try {
      bool isSaved = await _instance.setString(_userKey, jsonEncode(model.toMap()));
      await setAccessToken(model.token);
      return isSaved;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static String get accessToken {
    return _instance.getString(_Key.accessToken) ?? tokenInitialValue;
  }

  static Future setAccessToken(String accessToken) async {
    log('set Access accessToken: $accessToken');
    await _instance.setString(_Key.accessToken, accessToken);
  }

  static Future<bool> clear() async {
    return await _instance.clear();
  }
}
