import 'package:bloc/bloc.dart';
import 'package:bloc_example_03/Repository/login_repo.dart';
import 'package:bloc_example_03/constants/global_keys.dart';
import 'package:bloc_example_03/presentation/home/home_view.dart';
import 'package:bloc_example_03/presentation/login/bloc/login_event.dart';
import 'package:bloc_example_03/presentation/login/bloc/login_state.dart';
import 'package:flutter/material.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc(this.loginRepository) : super(LoginState()) {
    on<UsernameChanged>((event, emit) {
      emit(state.copyWith(username: event.username));
    });
    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<LoginSubmitted>(_onLogin);
  }

  Future<void> _onLogin(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      bool result = await loginRepository.login(state.username, state.password);
      if (result) {
        emit(state.copyWith(status: LoginStatus.success));
        print('Success 🎉');
      }
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.failure, errorMessage: e.toString()));
    }
  }
}
