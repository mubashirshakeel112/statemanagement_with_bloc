import 'package:bloc_example_03/services/login_service.dart';

class LoginRepository extends LoginService{
  final WCLoginService _wcLoginService = WCLoginService();
  @override
  Future<bool> login(String username, String password) async{
    return _wcLoginService.login(username, password);
  }
}