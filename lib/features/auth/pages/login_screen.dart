import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loopi_admin/core/router/app_router.dart';
import 'package:loopi_admin/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopi_admin/features/auth/widgets/auth_body.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formState = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
             
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) =>
                    const Center(child: CircularProgressIndicator()),
              );
              // Show a loading indicator
            }

            if (state is AuthSuccess) {
               ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Login Successful!')),
              );
              GoRouter.of(context).pop();
              // Navigate to the home screen or dashboard
              GoRouter.of(context).go(AppRouter.home);
            }
            if (state is AuthFaluire) {
              GoRouter.of(context).pop();
              // Show an error message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Login failed: ${state.message}')),
              );
            }
          },
          builder: (context, state) {
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 500,
                  minWidth: 300,
                  maxHeight: 700,
                ),
                child: Card(
                  color: Colors.blueGrey[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  margin: const EdgeInsets.all(16),
                  child: AuthBody(
                    formState: formState,
                    emailController: emailController,
                    passwordController: passwordController,
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





