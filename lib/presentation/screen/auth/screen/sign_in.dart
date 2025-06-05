import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../provider/auth_provider.dart';
import 'textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitLogin(BuildContext context) {
    final authProvider = context.read<AuthProvider>();
    authProvider.setUsername(_usernameController.text.trim());
    authProvider.setPassword(_passwordController.text.trim());

    if (authProvider.login()) {
      context.replace('/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid credentials')),
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: const Color(0xFFF6F6F6),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: screenWidth,
                    height: 250,
                    decoration: const BoxDecoration(
                      color: Color(0xFF567CBD),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(150),
                        bottomRight: Radius.circular(150),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(radius: 18.5, backgroundColor: Colors.white),
                      const SizedBox(width: 10),
                      CircleAvatar(
                        radius: 18.5,
                        // ignore: deprecated_member_use
                        backgroundColor: Colors.white.withOpacity(0.5),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'OneGoal',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Inria Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF567CBD),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(label: 'Username', controller: _usernameController),
                    const SizedBox(height: 16),
                    CustomTextField(label: 'Password', controller: _passwordController, isPassword: true),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value ?? false;
                            });
                            context.read<AuthProvider>().setRememberMe(rememberMe);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          activeColor: const Color(0xFF567CBD),
                        ),
                        const Expanded(
                          child: Text(
                            'Remember me',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF567CBD),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _submitLogin(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF567CBD),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(31.5),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          context.replace('/SignUp');
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF567CBD), width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(31.5),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Create an account',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF567CBD),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
