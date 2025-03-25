import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool isAgreed = false;

  void toggleCheckbox(bool? value) {
    setState(() {
      isAgreed = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: const Color(0xFFF6F6F6),
          child: Stack(
            children: [
              // Background Circle Decoration
              Positioned(
                left: -49,
                top: -293,
                child: Container(
                  width: 492,
                  height: 490,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF567CBD),
                  ),
                ),
              ),
              // "OneGoal" Logo and Circles
              Positioned(
                left: 124,
                top: 54,
                child: CircleAvatar(
                  radius: 18.5,
                  backgroundColor: Colors.white,
                ),
              ),
              Positioned(
                left: 161,
                top: 54,
                child: CircleAvatar(
                  radius: 18.5,
                  backgroundColor: Colors.white.withOpacity(0.5),
                ),
              ),
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
              // Form Fields
              Positioned(
                top: 280,
                left: 42,
                right: 42,
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
                    const CustomTextField(label: 'Username'),
                    const SizedBox(height: 16),
                    const CustomTextField(label: 'Email'),
                    const SizedBox(height: 16),
                    const CustomTextField(label: 'Password', isPassword: true),
                    const SizedBox(height: 16),
                    const CustomTextField(label: 'Confirm Password', isPassword: true),
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
                        Expanded(
                          child: Text(
                            'I agree to the Terms and Conditions',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF567CBD),
                              fontWeight: FontWeight.w700,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: isAgreed
                          ? () {
                              // Handle sign-up logic
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isAgreed ? const Color(0xFF567CBD) : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(31.5),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Center(
                        child: Text(
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
                          // Navigate to Sign In page
                        },
                        child: const Text(
                          'Already have an account? Sign in from here',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF567CBD),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
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

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isPassword;

  const CustomTextField({required this.label, this.isPassword = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        hintText: 'Enter $label',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF8DADE4)),
          borderRadius: BorderRadius.circular(30),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}
