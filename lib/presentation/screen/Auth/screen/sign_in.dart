import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Stack(
              children: [
                // Background design
                Positioned(
                  left: -49,
                  top: -293,
                  child: Container(
                    width: 492,
                    height: 490,
                    decoration: const BoxDecoration(
                      color: Color(0xFF567CBD),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                // Smaller decorative circles
                Positioned(
                  left: 124,
                  top: 54,
                  child: Container(
                    width: 37,
                    height: 37,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  left: 161,
                  top: 54,
                  child: Container(
                    width: 37,
                    height: 37,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                // Title and subtitle
                Positioned(
                  left: 206,
                  top: 63,
                  child: const Text(
                    'OneGoal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Inria Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Positioned(
                  left: 135,
                  top: 339,
                  child: const Text(
                    'Sign in Now',
                    style: TextStyle(
                      color: Color(0xFF567CBD),
                      fontSize: 24,
                      fontFamily: 'Inria Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                // Username field
                Positioned(
                  left: 43,
                  top: 400,
                  right: 43, // Added constraints
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: const TextStyle(
                        color: Color(0xFF567CBD),
                        fontSize: 16,
                        fontFamily: 'Inria Sans',
                        fontWeight: FontWeight.w700,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF6F6F6),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xFF8DADE4),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xFF567CBD),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                // Password field
                Positioned(
                  left: 43,
                  top: 485,
                  right: 43, // Added constraints
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        color: Color(0xFF567CBD),
                        fontSize: 16,
                        fontFamily: 'Inria Sans',
                        fontWeight: FontWeight.w700,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF6F6F6),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xFF8DADE4),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xFF567CBD),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                // Remember me checkbox
                Positioned(
                  left: 51,
                  top: 551,
                  child: Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                        activeColor: const Color(0xFF567CBD),
                      ),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                          color: Color(0xFF567CBD),
                          fontSize: 12,
                          fontFamily: 'Inria Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                // Forgot Password
                Positioned(
                  left: 253,
                  top: 551,
                  child: GestureDetector(
                    onTap: () {
                      // Handle forgot password action
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xFF567CBD),
                        fontSize: 12,
                        fontFamily: 'Inria Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                // Sign in button
                Positioned(
                  left: 51,
                  top: 701,
                  right: 51, // Added constraints
                  child: GestureDetector(
                    onTap: () {
                      // Handle sign-in logic here
                    },
                    child: Container(
                      width: double.infinity,
                      height: 39,
                      decoration: BoxDecoration(
                        color: const Color(0xFF567CBD),
                        borderRadius: BorderRadius.circular(31.5),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          color: Color(0xFFF6F6F6),
                          fontSize: 18,
                          fontFamily: 'Inria Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
