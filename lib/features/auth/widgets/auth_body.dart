import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopi_admin/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:loopi_admin/features/auth/widgets/auth_button.dart';
import 'package:loopi_admin/features/auth/widgets/auth_text_form_field.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({
    super.key,
    required this.formState,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formState;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formState,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipOval(
            child: SizedBox.fromSize(
              size: Size.fromRadius(70), // Image radius
              child: Image.asset('assets/images/loopi.png', fit: BoxFit.cover),
            ),
          ),
          const Text(
            'Loopi Admin',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          const Text(
            'Log In',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),
          AuthTextFormField(labelText: 'Email', controller: emailController),
          AuthTextFormField(
            labelText: 'Password',
            controller: passwordController,
          ),
          AuthButton(
            onPressed: () {
              if (formState.currentState?.validate() ?? false) {
                BlocProvider.of<AuthCubit>(context).logIn(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
                // Handle login logic here
              }
            },
          ),
        ],
      ),
    );
  }
}
