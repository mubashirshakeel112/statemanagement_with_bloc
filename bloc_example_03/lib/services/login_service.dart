import 'dart:convert';

import 'package:bloc_example_03/constants/endpoints.dart';
import 'package:bloc_example_03/domain/auth_data_model.dart';
import 'package:bloc_example_03/extension.dart';
import 'package:bloc_example_03/infrastructure/api_exception.dart';
import 'package:bloc_example_03/services/base_service.dart';
import 'package:bloc_example_03/services/preferences.dart';
import 'package:http/http.dart' as http;

abstract class LoginService extends BaseService{
  Future<bool> login(String username, String password);
}

class WCLoginService extends LoginService {
  @override
  Future<bool> login(String username, String password) async {
    try {
      Uri endpoint = Uri.parse(Endpoints.login);
      http.Response response = await http.post(
        endpoint,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );
      if (response.isApiSuccessful) {
        Map<String, dynamic> result = jsonDecode(response.body) as Map<String, dynamic>;
        print(result);
        AuthDataModel model = AuthDataModel.fromMap(result);
        print('response: ${model.token}');
        addTokenToPayload(model.token);
        await Preference.saveAuthDataModel(model);
        print('Token: ${result['token']}');
        return true;
      } else {
        throw ApiException('POST', response.statusCode, response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
