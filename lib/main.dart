import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quiz_app/app/dashboard/dashboard_view.dart';
import 'package:quiz_app/app/login/login_view/login_view.dart';
import 'package:quiz_app/routes/routes.dart';
import 'app_style/app_colors.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: secondColor),
        useMaterial3: true,
      ),
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //  already logged in.
            if (snapshot.hasData) {
              return const DashboardView();
            }
            // not logged in
            return const LogInView();
          }
          ),
    );
  }
}
