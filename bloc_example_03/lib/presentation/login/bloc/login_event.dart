import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

// class Login extends LoginEvent{
//   final String username;
//   final String password;
//
//   const Login({this.username = '', this.password = ''});
//
//   @override
//   List<Object?> get props => [username, password];
// }

class UsernameChanged extends LoginEvent {
  final String username;
  const UsernameChanged(this.username);

  @override
  List<Object?> get props => [username];
}

class PasswordChanged extends LoginEvent {
  final String password;
  const PasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}