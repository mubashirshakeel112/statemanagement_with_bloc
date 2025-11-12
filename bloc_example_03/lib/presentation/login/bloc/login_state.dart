import 'package:equatable/equatable.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  final LoginStatus status;
  final String username;
  final String password;
  final String errorMessage;

  const LoginState({this.status = LoginStatus.initial, this.username = '', this.password = '', this.errorMessage = ''});

  LoginState copyWith({LoginStatus? status, String? username, String? password, String? errorMessage}) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool get isLoginValid => username.isNotEmpty && password.isNotEmpty;

  @override
  List<Object?> get props => [status, username, password, errorMessage];
}
