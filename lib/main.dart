import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loopi_admin/core/router/app_router.dart';
import 'package:loopi_admin/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const LoopiAdminApp());
}

class LoopiAdminApp extends StatelessWidget {
  const LoopiAdminApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Loopi Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
