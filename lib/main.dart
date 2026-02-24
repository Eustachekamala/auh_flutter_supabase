import 'package:auth_supabase/screens/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // Initialize supabase
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://iapzddwfdozktjfqqyoq.supabase.co',
    anonKey: 'sb_publishable_WJulLCFEeP296p6qImYSFQ_z9FLWYBV'
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth Supabase',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginPage(),
    );
  }
}
