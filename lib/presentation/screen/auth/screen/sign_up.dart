import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';
import 'textfield.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool isAgreed = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void toggleCheckbox(bool? value) {
    setState(() {
      isAgreed = value ?? false;
    });
  }

  void _submitSignUp(BuildContext context) {
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    context.read<AuthProvider>().signUp(
          username: username,
          email: email,
          password: password,
        );

    context.replace('/home');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
              // Top decorative circle + logo
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

              // Form content under the circle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF567CBD),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(label: 'Username', controller: _usernameController),
                    const SizedBox(height: 16),
                    CustomTextField(label: 'Email', controller: _emailController),
                    const SizedBox(height: 16),
                    CustomTextField(label: 'Password', controller: _passwordController, isPassword: true),
                    const SizedBox(height: 16),
                    CustomTextField(label: 'Confirm Password', controller: _confirmPasswordController, isPassword: true),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: isAgreed,
                          onChanged: toggleCheckbox,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          activeColor: const Color(0xFF567CBD),
                        ),
                        const Expanded(
                          child: Text(
                            'I agree to the Terms and Conditions',
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
                        onPressed: isAgreed ? () => _submitSignUp(context) : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isAgreed ? const Color(0xFF567CBD) : Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(31.5),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          context.replace('/SignIn');
                        },
                        child: const Text(
                          'Already have an account? Sign in from here',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF567CBD),
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
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

