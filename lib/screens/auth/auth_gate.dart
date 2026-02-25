/*
 AUTH GATE - This will continuously listen for auth state changes
 ------------------------------------------------------------------

 unauthenticated -> login page
 authenticated -> profile page
*/

import 'package:auth_supabase/screens/pages/login_page.dart';
import 'package:auth_supabase/screens/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // Listen to auth state changes
      stream: Supabase.instance.client.auth.onAuthStateChange,
      // Build the appropriate page based on auth state
      builder: (context, snapshot) {
        // loading
        if (!snapshot.hasData){
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.black26,
              ),
            ),
          );
        }

        // check if there's a valid session currently
        final session = snapshot.hasData ? snapshot.data!.session : null;
        if (session != null){
          return const ProfilePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}