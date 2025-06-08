import 'package:go_router/go_router.dart';
import 'package:loopi_admin/features/auth/pages/login_screen.dart';
import 'package:loopi_admin/features/home/pages/home_screen.dart';

class AppRouter {
  static const String auth = '/';
  static const String home = '/home';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>  LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(), 
      ),
    ]
   );

}