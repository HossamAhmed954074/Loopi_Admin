import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loopi_admin/features/auth/widgets/auth_text_form_field.dart';
import 'package:loopi_admin/features/home/cubits/driver_register_cubit/cubit/driver_register_cubit.dart';

class RegisterDriverBody extends StatelessWidget {
  RegisterDriverBody({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController fromCityController = TextEditingController();
  final TextEditingController toCityController = TextEditingController();
  final TextEditingController plateNumberController = TextEditingController();
  final TextEditingController seatsController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    idController.dispose();
    addressController.dispose();
    fromCityController.dispose();
    toCityController.dispose();
    plateNumberController.dispose();
    seatsController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverRegisterCubit, DriverRegisterState>(
      listener: (context, state) {
        if (state is DriverRegisterLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        }
        if (state is DriverRegisterSuccess) {
          GoRouter.of(context).pop();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('تم أنشاء الحساب بنجاح ')));
          nameController.clear();
          phoneController.clear();
          idController.clear();
          addressController.clear();
          fromCityController.clear();
          toCityController.clear();
          plateNumberController.clear();
          seatsController.clear();
          emailController.clear();
          passwordController.clear();
        }
        if (state is DriverRegisterFailure) {
          GoRouter.of(context).pop();
          // Show an error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login failed: ${state.errorMessage}')),
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'أنشاء حساب سائق جديد',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AuthTextFormField(
                        labelText: 'اسم السائق ',
                        controller: nameController,
                      ),
                      const SizedBox(height: 10),
                      AuthTextFormField(
                        labelText: ' رقم الهاتف ',
                        controller: phoneController,
                      ),
                      const SizedBox(height: 10),
                      AuthTextFormField(
                        labelText: 'رقم الهوية ',
                        controller: idController,
                      ),
                      const SizedBox(height: 10),
                      AuthTextFormField(
                        labelText: 'العنوان',
                        controller: addressController,
                      ),
                      const SizedBox(height: 10),
                      AuthTextFormField(
                        labelText: 'من مدينة',
                        controller: fromCityController,
                      ),
                      const SizedBox(height: 10),
                      AuthTextFormField(
                        labelText: 'الي جامعة',
                        controller: toCityController,
                      ),
                      const SizedBox(height: 10),
                      AuthTextFormField(
                        labelText: 'رقم اللوحة السيارة',
                        controller: plateNumberController,
                      ),
                      const SizedBox(height: 10),
                      AuthTextFormField(
                        labelText: 'عدد المقاعد',
                        controller: seatsController,
                      ),
                      const SizedBox(height: 10),
                      AuthTextFormField(
                        labelText: 'البريد الإلكتروني',
                        controller: emailController,
                      ),
                      const SizedBox(height: 10),
                      AuthTextFormField(
                        labelText: 'كلمة المرور',
                        controller: passwordController,
                      ),
                      const SizedBox(height: 10),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(200, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          BlocProvider.of<DriverRegisterCubit>(
                            context,
                          ).registerDriver(
                            email: emailController.text,
                            password: passwordController.text,
                            address: addressController.text,
                            id: idController.text,
                            name: nameController.text,
                            phoneNumber: phoneController.text,
                            fromCity: fromCityController.text,
                            toCity: toCityController.text,
                            plateNumber: plateNumberController.text,
                            seats: int.parse(seatsController.text),
                          );
                        },
                        child: const Text('أنشاء حساب سائق جديد'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
