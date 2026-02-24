import 'package:auth_supabase/screens/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // get  auth state
  final authService = AuthService();

  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // login button pressed
  void login() async {
    // prepare data
    final email = _emailController.text;
    final password = _passwordController.text;

    // sign in with email and password
    try {
      await authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(
            children: [
              // email
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              ),
          
              const  SizedBox(height: 10),
          
              // password
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              ),
          
              const SizedBox(height: 10,),
          
              // Button
              MaterialButton(
                onPressed: login,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10)
                ),
                padding: EdgeInsets.all(15.0),
                color: Colors.black,
                child: Text("Login", style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
                ),)
              ),
          
              const SizedBox(height: 25.0,),
          
              // Don't have an account
              Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 0.5, color: Colors.grey[500]),
                  ),
          
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text("Don't have an account ? "),
                  ),
          
                  Expanded(
                     child: Divider(thickness: 0.5, color: Colors.grey[500]),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
