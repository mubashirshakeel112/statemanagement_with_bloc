import 'package:bloc_example_03/presentation/home/home_view.dart';
import 'package:bloc_example_03/presentation/login/bloc/login_bloc.dart';
import 'package:bloc_example_03/presentation/login/bloc/login_event.dart';
import 'package:bloc_example_03/presentation/login/bloc/login_state.dart';
import 'package:bloc_example_03/widgets/custom_button.dart';
import 'package:bloc_example_03/widgets/custom_loader.dart';
import 'package:bloc_example_03/widgets/custom_snack_bar.dart';
import 'package:bloc_example_03/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  static const String id = '/login_view';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isPassword = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          ShowSnackBar.showSuccessSnackBar(context, 'Success', 'Login Successfully');
          Navigator.of(context).pushReplacementNamed(HomeView.id);
        } else if (state.status == LoginStatus.failure) {
          ShowSnackBar.showErrorSnackBar(context, 'Error', 'Login Failed');
        }
      },
      child: Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return SafeArea(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Spacer(flex: 2),
                      Icon(Icons.lock_outline, size: 80, color: Theme.of(context).primaryColor),
                      const SizedBox(height: 16),
                      const Text(
                        'Welcome Back!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Sign in to continue',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 48),
                      CustomTextField(
                        hintText: 'Username',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 5),
                          child: Icon(Icons.person_outline, color: Colors.grey),
                        ),
                        onChanged: (value) => context.read<LoginBloc>().add(UsernameChanged(value)),
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        hintText: 'Password',
                        obscureText: !isPassword,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 5),
                          child: Icon(Icons.lock_outline, color: Colors.grey),
                        ),
                        isSuffixIcon: true,
                        suffixIcon: !isPassword ? Icons.visibility_off : Icons.visibility,
                        onSuffixIconPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                        onChanged: (value) => context.read<LoginBloc>().add(PasswordChanged(value)),
                      ),
                      const SizedBox(height: 24),
                      state.status == LoginStatus.loading
                          ? CustomLoader()
                          : PrimaryButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() ?? false) {
                                  if (state.isLoginValid) {
                                    context.read<LoginBloc>().add(LoginSubmitted());
                                  } else {
                                    ShowSnackBar.showMissingSnackBar(context, 'Missing Info', 'Empty Fields Required');
                                  }
                                }
                              },
                              title: 'LOGIN',
                            ),
                      const Spacer(flex: 3),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
