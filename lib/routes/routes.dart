import 'package:flutter/material.dart';
import '../app/dashboard/dashboard_view.dart';
import '../app/login/login_view/login_view.dart';
import '../app/register/register_view/register_view.dart';



Map<String, Widget Function(BuildContext)> appRoutes={
  '/logIn': (context) => const LogInView(),
  '/register': (context) => const RegisterView(),
  '/dashboard': (context) => const DashboardView(),
};